$enc = New-Object System.Text.UTF8Encoding($false)
$dir = "c:\Work\Samples\html\JEE_tracker\StudyCompanion_V2"

# ── New catalog JS (select-based, not datalist-based) ────────────────────────
$CAT_JS = @'
// ── JEE Catalog & Select helpers ─────────────────────────────────────────────
const _JEE={
  "Physics":{"Mechanics":["Kinematics","Laws of Motion","Work Energy and Power","Rotational Motion","Gravitation","Simple Harmonic Motion","Fluid Mechanics","Elasticity","Surface Tension"],"Thermodynamics":["Thermal Properties","Laws of Thermodynamics","Kinetic Theory of Gases","Calorimetry","Heat Transfer"],"Electrostatics":["Electric Charges and Fields","Gauss Law","Electric Potential","Capacitance","Electric Dipole"],"Current Electricity":["Ohm's Law and Resistance","Kirchhoff's Laws","Wheatstone Bridge","RC Circuits","Potentiometer","EMF and Internal Resistance"],"Magnetism":["Magnetic Effects of Current","Biot-Savart Law","Electromagnetic Induction","AC Circuits","Transformers","Magnetic Properties"],"Optics":["Ray Optics","Wave Optics","Refraction and Lenses","Total Internal Reflection","Optical Instruments","Interference and Diffraction"],"Modern Physics":["Photoelectric Effect","Dual Nature","Atomic Models","Nuclear Physics","Radioactivity","Semiconductors","Logic Gates"],"Waves":["Wave Motion","Sound Waves","Doppler Effect","Standing Waves","Beats","Resonance"],"Experimental Physics":["Vernier Callipers","Screw Gauge","Simple Pendulum","Resonance Tube","Meter Bridge"]},
  "Chemistry":{"Physical Chemistry":["Mole Concept","Atomic Structure","Chemical Bonding","VSEPR Theory","States of Matter","Thermodynamics","Chemical Equilibrium","Ionic Equilibrium","Electrochemistry","Chemical Kinetics","Solutions","Surface Chemistry","Redox Reactions","Colligative Properties"],"Organic Chemistry":["Basic Organic Concepts","IUPAC Nomenclature","Isomerism","Reaction Mechanisms","Alkanes Alkenes Alkynes","Aromatic Compounds","Haloalkanes and Haloarenes","Alcohols Phenols Ethers","Aldehydes and Ketones","Carboxylic Acids","Amines","Biomolecules","Polymers","Chemistry in Everyday Life"],"Inorganic Chemistry":["Periodic Table","s-Block Elements","p-Block Elements","d and f Block Elements","Coordination Compounds","Metallurgy","Environmental Chemistry","Hydrogen","Qualitative Analysis"]},
  "Mathematics":{"Algebra":["Sets Relations Functions","Complex Numbers","Permutation and Combination","Binomial Theorem","Sequences and Series","Matrices","Determinants","Probability","Mathematical Induction","Quadratic Equations"],"Calculus":["Limits and Continuity","Differentiation","Application of Derivatives","Indefinite Integration","Definite Integration","Area Under Curves","Differential Equations"],"Coordinate Geometry":["Straight Lines","Circles","Parabola","Ellipse","Hyperbola","Pair of Straight Lines","Distance and Section Formula"],"Trigonometry":["Trigonometric Ratios","Trigonometric Equations","Inverse Trigonometric Functions","Heights and Distances","Properties of Triangle"],"Vectors and 3D Geometry":["Vectors Basics","Dot and Cross Product","3D Coordinate Geometry","Direction Cosines","Planes and Lines"],"Statistics and Reasoning":["Statistics","Mathematical Reasoning","Linear Programming"]},
  "Biology":{"Botany":["Cell Structure and Function","Cell Division","Plant Kingdom","Morphology of Plants","Anatomy of Plants","Plant Physiology","Photosynthesis","Respiration in Plants","Plant Growth and Development","Plant Reproduction","Genetics","Molecular Basis of Inheritance","Evolution","Biotechnology"],"Zoology":["Animal Kingdom","Structural Organisation in Animals","Human Digestion","Breathing and Gas Exchange","Body Fluids and Circulation","Excretory Products","Locomotion and Movement","Neural Control","Chemical Coordination","Reproduction in Organisms","Human Reproduction","Reproductive Health","Human Health and Disease","Microbes in Human Welfare","Ecosystems and Environment"]}
};

function seedCatalog(cb){
  if(!db.objectStoreNames.contains('catalog')){cb();return;}
  const tx=db.transaction('catalog','readwrite');
  const os=tx.objectStore('catalog');
  os.count().onsuccess=ev=>{
    if(ev.target.result>0){cb();return;}
    Object.keys(_JEE).forEach(sub=>{
      os.add({type:'subject',value:sub,parent:''});
      Object.keys(_JEE[sub]).forEach(chap=>{
        os.add({type:'chapter',value:chap,parent:sub});
        (_JEE[sub][chap]||[]).forEach(t=>os.add({type:'topic',value:t,parent:sub+'|'+chap}));
      });
    });
    tx.oncomplete=cb;tx.onerror=cb;
  };
}

function buildDataLists(){
  if(!db)return;
  seedCatalog(()=>{
    const subjects=new Set(),subChap={},subTopic={};
    let phase=2;
    const finish=()=>{
      if(--phase>0)return;
      window._ss=subjects;window._sc=subChap;window._st=subTopic;
      fillSubjectSelect();
    };
    if(db.objectStoreNames.contains('catalog')){
      db.transaction('catalog').objectStore('catalog').openCursor().onsuccess=e=>{
        const c=e.target.result;
        if(c){const v=c.value;
          if(v.type==='subject')subjects.add(v.value);
          else if(v.type==='chapter'){if(!subChap[v.parent])subChap[v.parent]=new Set();subChap[v.parent].add(v.value);}
          else if(v.type==='topic'){if(!subTopic[v.parent])subTopic[v.parent]=new Set();subTopic[v.parent].add(v.value);}
          c.continue();}else finish();
      };
    }else finish();
    const recStores=['learning','practice','mistakes','formula','revision'].filter(s=>db.objectStoreNames.contains(s));
    let rp=recStores.length||1;
    const rdone=()=>{if(--rp===0)finish();};
    if(!recStores.length){rdone();return;}
    recStores.forEach(store=>{
      db.transaction(store).objectStore(store).openCursor().onsuccess=e=>{
        const c=e.target.result;
        if(c){const v=c.value;
          if(v.subject){subjects.add(v.subject);
            if(v.chapter){if(!subChap[v.subject])subChap[v.subject]=new Set();subChap[v.subject].add(v.chapter);
              if(v.topic){const k=v.subject+'|'+v.chapter;if(!subTopic[k])subTopic[k]=new Set();subTopic[k].add(v.topic);}}}
          c.continue();}else rdone();};
    });
  });
}

function fillSubjectSelect(){
  const sel=document.getElementById('subject');
  if(!sel||sel.tagName!=='SELECT')return;
  const cur=sel.value;
  sel.innerHTML='<option value="">-- Select Subject --</option>';
  [...(window._ss||new Set())].sort().forEach(s=>{
    const o=document.createElement('option');o.value=s;o.textContent=s;sel.appendChild(o);
  });
  const add=document.createElement('option');add.value='__new__';add.textContent='+ Add New Subject...';sel.appendChild(add);
  if(cur&&cur!=='__new__')sel.value=cur;
  fillChapterSelect((sel.value&&sel.value!=='__new__')?sel.value:'');
}

function fillChapterSelect(subVal){
  const sel=document.getElementById('chapter');
  if(!sel||sel.tagName!=='SELECT')return;
  const cur=sel.value;
  sel.innerHTML='<option value="">-- Select Chapter --</option>';
  const sc=window._sc||{};
  [...(sc[subVal]||new Set())].sort().forEach(ch=>{
    const o=document.createElement('option');o.value=ch;o.textContent=ch;sel.appendChild(o);
  });
  const add=document.createElement('option');add.value='__new__';add.textContent='+ Add New Chapter...';sel.appendChild(add);
  if(cur&&cur!=='__new__')sel.value=cur;
  updateTopicDL(subVal,(sel.value&&sel.value!=='__new__')?sel.value:'');
}

function onSubjectChange(subVal){
  if(subVal==='__new__'){
    const sel=document.getElementById('subject');
    const v=(prompt('Enter new subject name:')||'').trim();
    if(v){autoSaveToCatalog(v,null,null);const o=document.createElement('option');o.value=v;o.textContent=v;sel.insertBefore(o,sel.lastElementChild);sel.value=v;fillChapterSelect(v);}
    else sel.value='';
    return;
  }
  fillChapterSelect(subVal);
}

function onChapterChange(chapVal){
  const subVal=(document.getElementById('subject')||{}).value||'';
  if(chapVal==='__new__'){
    const sel=document.getElementById('chapter');
    const v=(prompt('Enter new chapter name:')||'').trim();
    if(v){autoSaveToCatalog(subVal,v,null);const o=document.createElement('option');o.value=v;o.textContent=v;sel.insertBefore(o,sel.lastElementChild);sel.value=v;updateTopicDL(subVal,v);}
    else sel.value='';
    return;
  }
  updateTopicDL(subVal,chapVal);
}

function updateTopicDL(subVal,chapVal){
  const dlt=document.getElementById('dl-topic');if(!dlt)return;
  dlt.innerHTML='';
  const st=window._st||{};
  [...(st[subVal+'|'+chapVal]||new Set())].sort().forEach(t=>{
    const o=document.createElement('option');o.value=t;dlt.appendChild(o);
  });
}

function autoSaveToCatalog(sub,chap,topic){
  if(!sub||sub==='__new__'||!db||!db.objectStoreNames.contains('catalog'))return;
  const ss=window._ss||new Set(),sc=window._sc||{},st=window._st||{};
  const toAdd=[];
  if(!ss.has(sub)){toAdd.push({type:'subject',value:sub,parent:''});ss.add(sub);window._ss=ss;}
  if(chap&&chap!=='__new__'){if(!sc[sub])sc[sub]=new Set();if(!sc[sub].has(chap)){toAdd.push({type:'chapter',value:chap,parent:sub});sc[sub].add(chap);}}
  if(topic&&topic.trim()&&chap&&chap!=='__new__'){const k=sub+'|'+chap;if(!st[k])st[k]=new Set();if(!st[k].has(topic)){toAdd.push({type:'topic',value:topic,parent:k});st[k].add(topic);}}
  if(toAdd.length){const tx=db.transaction('catalog','readwrite');toAdd.forEach(r=>tx.objectStore('catalog').add(r));fillSubjectSelect();if(chap&&chap!=='__new__'){fillChapterSelect(sub);if(topic&&chap)updateTopicDL(sub,chap);}}
}
// ── End JEE Catalog helpers ───────────────────────────────────────────────────
'@

# HTML snippet replacements ───────────────────────────────────────────────────
$SELECT_SUBJECT = '<select id="subject" onchange="onSubjectChange(this.value)"><option value="">-- Select Subject --</option></select>'
$SELECT_CHAPTER = '<select id="chapter" onchange="onChapterChange(this.value)"><option value="">-- Select Chapter --</option></select>'

$pages = @(
  @{
    file = "learning_book.html"
    subOld = '<input id="subject" list="dl-subject" autocomplete="off" placeholder="e.g. Physics" oninput="updateChapterDL(this.value)">'
    chapOld = '<input id="chapter" list="dl-chapter" autocomplete="off" placeholder="e.g. Laws of Motion" oninput="updateTopicDL(subject.value,this.value)">'
    dlOld  = '<datalist id="dl-subject"></datalist><datalist id="dl-chapter"></datalist><datalist id="dl-topic"></datalist>'
    dlNew  = '<datalist id="dl-topic"></datalist>'
    editOld = 'rid.value=r.id;subject.value=r.subject;chapter.value=r.chapter;'
    editNew = 'rid.value=r.id;subject.value=r.subject;fillChapterSelect(r.subject);chapter.value=r.chapter;updateTopicDL(r.subject,r.chapter||'''');'
  },
  @{
    file = "practice_book.html"
    subOld = '<input id="subject" list="dl-subject" autocomplete="off" placeholder="e.g. Chemistry" oninput="updateChapterDL(this.value)">'
    chapOld = '<input id="chapter" list="dl-chapter" autocomplete="off" placeholder="e.g. Equilibrium">'
    dlOld  = '<datalist id="dl-subject"></datalist><datalist id="dl-chapter"></datalist>'
    dlNew  = ''
    editOld = 'subject.value=r.subject;chapter.value=r.chapter;diff.value=r.diff;'
    editNew = 'subject.value=r.subject;fillChapterSelect(r.subject);chapter.value=r.chapter;diff.value=r.diff;'
  },
  @{
    file = "mistake_book.html"
    subOld = '<input id="subject" list="dl-subject" autocomplete="off" placeholder="e.g. Maths" oninput="updateChapterDL(this.value)">'
    chapOld = '<input id="chapter" list="dl-chapter" autocomplete="off" placeholder="e.g. Integration">'
    dlOld  = '<datalist id="dl-subject"></datalist><datalist id="dl-chapter"></datalist>'
    dlNew  = ''
    editOld = 'subject.value=r.subject;chapter.value=r.chapter;type.value=r.type;'
    editNew = 'subject.value=r.subject;fillChapterSelect(r.subject);chapter.value=r.chapter;type.value=r.type;'
  },
  @{
    file = "formula_book.html"
    subOld = '<input id="subject" list="dl-subject" autocomplete="off" placeholder="e.g. Physics" oninput="updateChapterDL(this.value)">'
    chapOld = '<input id="chapter" list="dl-chapter" autocomplete="off" placeholder="e.g. Electrostatics">'
    dlOld  = '<datalist id="dl-subject"></datalist><datalist id="dl-chapter"></datalist>'
    dlNew  = ''
    editOld = 'subject.value=r.subject;chapter.value=r.chapter;formula.value=r.formula;'
    editNew = 'subject.value=r.subject;fillChapterSelect(r.subject);chapter.value=r.chapter;formula.value=r.formula;'
  },
  @{
    file = "revision_planner.html"
    subOld = '<input id="subject" list="dl-subject" autocomplete="off" placeholder="e.g. Physics" oninput="updateChapterDL(this.value)">'
    chapOld = '<input id="chapter" list="dl-chapter" autocomplete="off" placeholder="e.g. Optics">'
    dlOld  = '<datalist id="dl-subject"></datalist><datalist id="dl-chapter"></datalist>'
    dlNew  = ''
    editOld = "subject.value=r.subject||'';chapter.value=r.chapter||'';"
    editNew = "subject.value=r.subject||'';fillChapterSelect(r.subject||'');chapter.value=r.chapter||'';"
  }
)

foreach($p in $pages){
  $f = "$dir\$($p.file)"
  $c = [System.IO.File]::ReadAllText($f, $enc)

  # 1. Replace subject input with select
  if($c.Contains($p.subOld)){$c = $c.Replace($p.subOld, $SELECT_SUBJECT);Write-Host "$($p.file): subject -> select OK"}
  else{Write-Host "MISS subject: $($p.file)"}

  # 2. Replace chapter input with select
  if($c.Contains($p.chapOld)){$c = $c.Replace($p.chapOld, $SELECT_CHAPTER);Write-Host "$($p.file): chapter -> select OK"}
  else{Write-Host "MISS chapter: $($p.file)"}

  # 3. Replace datalists
  if($c.Contains($p.dlOld)){$c = $c.Replace($p.dlOld, $p.dlNew);Write-Host "$($p.file): datalist OK"}
  else{Write-Host "MISS datalist: $($p.file)"}

  # 4. Update edit() to call fillChapterSelect
  if($c.Contains($p.editOld)){$c = $c.Replace($p.editOld, $p.editNew);Write-Host "$($p.file): edit() OK"}
  else{Write-Host "MISS edit(): $($p.file)"}

  # 5. Replace catalog JS block (from const _JEE= to end)
  $marker = 'const _JEE={'
  $idx = $c.IndexOf($marker)
  if($idx -ge 0){
    # find the last \n before the marker, trimming comments/blanks
    $before = $c.Substring(0, $idx).TrimEnd()
    # trim any trailing blank or comment lines
    $blines = $before -split "`n"
    $trimmedBefore = ($blines | Where-Object {$_ -notmatch '^\s*$' -and $_ -notmatch '^\s*//'}) -join "`n"
    $c = $trimmedBefore + "`n`n" + $CAT_JS.Trim() + "`n</script></body></html>"
    Write-Host "$($p.file): catalog JS replaced"
  }else{
    Write-Host "MISS catalog: $($p.file)"
  }

  [System.IO.File]::WriteAllText($f, $c, $enc)
}

Write-Host "`nDone."
