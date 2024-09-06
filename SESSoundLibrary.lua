-- Author      : Chris Backpack-Malfurion
--updated: 4/25/2020
local SESpath = "Interface/AddOns/SuperEmotesAndSounds/Sounds/"		--ROOT for sound files

SESTriggersLIB = 
{
	Triggered = 
	{
		SESpath .. "TRIGGERS/TRIGGERED/kid.mp3",
		SESpath .. "Emotes/nailedit.mp3",
		SESpath .. "Emotes/whatswrongwithme.mp3",
		SESpath .. "Emotes/wheresmybackup.mp3"
	},
	Sad = 
	{
		SESpath .. "TRIGGERS/TRIGGERED/gofyourself.mp3",
		SESpath .. "TRIGGERS/TRIGGERED/kid.mp3"
	},
	Happy = 
	{
		SESpath .. "TRIGGERS/TRIGGERED/gofyourself.mp3",
		SESpath .. "TRIGGERS/TRIGGERED/kid.mp3"
	},
	Leave = 
	{
		SESpath .. "TRIGGERS/TRIGGERED/gofyourself.mp3",
		SESpath .. "TRIGGERS/TRIGGERED/kid.mp3"
	},
	Join = 
	{
		SESpath .. "TRIGGERS/TRIGGERED/gofyourself.mp3",
		SESpath .. "TRIGGERS/TRIGGERED/kid.mp3"
	}
	

}

SESEmotesLIB =				--{Default Command, Clip Path, description of clip}
{
	--kris
	{'PLAYTHEGAME'  ,SESpath .."Emotes/PLAYTHEGAME.mp3","PLAYTHEGAME"},
	{'bully'  ,SESpath .."Emotes/bully.mp3","bully"},
	{'ciciban'  ,SESpath .."Emotes/CICIBAN.mp3","ciciban"},
	{'flg'  ,SESpath .."Emotes/fluessig.mp3","flg"},
	{'ckn1'  ,SESpath .."Emotes/ckn1.mp3","ckn1"},
	{'ckn2'  ,SESpath .."Emotes/ckn2.mp3","ckn2"},
	{'ckn3'  ,SESpath .."Emotes/ckn3.mp3","ckn3"},
	{'ckn4'  ,SESpath .."Emotes/ckn4.mp3","ckn4"},
	{'gas'  ,SESpath .."Emotes/gasgasgas.mp3","gas"},
	{'ceyzo2'  ,SESpath .."Emotes/ceyzo2.mp3","ceyzo2"},
	{'rainer'  ,SESpath .."Emotes/rainer.mp3","rainer"},
	{'knock'  ,SESpath .."Emotes/knock.mp3","knock"},
	{'ceyzo'  ,SESpath .."Emotes/ceyzo.mp3","ceyzo"},
	{'retard'  ,SESpath .."Emotes/retard.mp3","retard"},
	{'mjstop'  ,SESpath .."Emotes/mjstop.mp3","mjstop"},
	{'roblox'  ,SESpath .."Emotes/roblox.mp3","roblox"},
	{'miss'  ,SESpath .."Emotes/miss.mp3","miss"},
	{'stopit'  ,SESpath .."Emotes/stopit.mp3","stopit"},
	{'china'  ,SESpath .."Emotes/china.mp3","china"},
	{'nodog'  ,SESpath .."Emotes/nodog.mp3","nodog"},
	{'hanging'  ,SESpath .."Emotes/hanging.mp3","hangin around"},
	{'wowowen'  ,SESpath .."Emotes/wowowen.mp3","wowowen"},
	{'dejavu'  ,SESpath .."Emotes/dejavu.mp3","dejavu"},
	{'retard'  ,SESpath .."Emotes/retard.mp3","retard alert"},
	{'jaa'  ,SESpath .."Emotes/jaa.mp3","jaa"},
	{'raus'  ,SESpath .."Emotes/raus.mp3","ich muss raus"},
	{'gratsme'  ,SESpath .."Emotes/gratsme.mp3","grats me bois"},
	{'keyboard'  ,SESpath .."Emotes/keyboard.mp3","keyboard"},
	{'uhoh'  ,SESpath .."Emotes/uhoh.mp3","uhoh"},
	{'uwe'  ,SESpath .."Emotes/uwe.mp3","uuuuweeee"},
	{'helfen'  ,SESpath .."Emotes/helfen.mp3","bitte helfen"},
	{'wasisthierlos'  ,SESpath .."Emotes/wasisthierlos.mp3","was ist hier los"},
	{'deutschland'  ,SESpath .."Emotes/deutschland.mp3","deutschland"},
	{'laugh'  ,SESpath .."Emotes/laugh.mp3","laugh"},
	{'spielmitmir'  ,SESpath .."Emotes/spielmitmir.mp3","spiel mit mir"},
	{'waschmitdir'  ,SESpath .."Emotes/waschmitdir.mp3","wasch mit dir"},
	{'viecher'  ,SESpath .."Emotes/viecher.mp3","raus mit die viecher"},
	{'nass'  ,SESpath .."Emotes/nass.mp3","hose ist nass"},
	{'amusic'  ,SESpath .."Emotes/amusic.mp3","musik"},
	{'tneverdies'  ,SESpath .."Emotes/tblade.mp3","technoblade"},
	{'dave'  ,SESpath .."Emotes/dave.mp3","scooter dave"},
	{'depolice'  ,SESpath .."Emotes/depolice.mp3","De Police"},
	{'bruh'  ,SESpath .."Emotes/bruh.mp3","bruh"},
	{'whyrugay'  ,SESpath .."Emotes/whyrugay.mp3","why are you gay"},
	{'augh'  ,SESpath .."Emotes/augh.mp3","augh"},
	{'uwu'  ,SESpath .."Emotes/uwu.mp3","uwu"},
	{'twohrs'  ,SESpath .."Emotes/twohrs.mp3","two hrs ltr"},
	{'uwu2'  ,SESpath .."Emotes/uwu2.mp3","uwu2"},
	{'daddychill'  ,SESpath .."Emotes/daddychill.mp3","daddy chill"},
	{'harder'  ,SESpath .."Emotes/harder.mp3","harder daddy"},
	{'bob'  ,SESpath .."Emotes/bob.mp3","bob"},
	{'berserk'  ,SESpath .."Emotes/berserk.mp3","berserk"},
	{'nogod'  ,SESpath .."Emotes/nogod.mp3","NOO"},
	{'stepbro'  ,SESpath .."Emotes/stepbro.mp3","stepbro"},
	{'yeet'  ,SESpath .."Emotes/yeet.mp3","yeet"},
	{'rizz'  ,SESpath .."Emotes/rizz.mp3","rizz"},
	{'run'  ,SESpath .."Emotes/run.mp3","run"},
	{'underthewater'  ,SESpath .."Emotes/underthewater.mp3","i'm under the water"},
	{'indanger'  ,SESpath .."Emotes/indanger.mp3","i'm in danger"},
	{'johncena'  ,SESpath .."Emotes/johncena.mp3","john cena entrance"},
	{'doomslayer'  ,SESpath .."Emotes/doomslayer.mp3","doomslayer"},
	{'doom'  ,SESpath .."Emotes/doom.mp3","doom"},
	{'doom2'  ,SESpath .."Emotes/doom2.mp3","doom2"},
	{'schwifty'  ,SESpath .."Emotes/schwifty.mp3","schwifty"},
	{'cocaine'  ,SESpath .."Emotes/cocaine.mp3","cocaine"},
	{'hookers'  ,SESpath .."Emotes/hookers.mp3","idiot hookers"},
	{'daddygag'  ,SESpath .."Emotes/daddygag.mp3","gag"},
	{'puke'  ,SESpath .."Emotes/puke.mp3","puke"},
	{'omagefickt'  ,SESpath .."Emotes/omagefickt.mp3","omagefickt"},
	{'indian'  ,SESpath .."Emotes/indian.mp3","indian"},
	{'heisenberg'  ,SESpath .."Emotes/heisenberg.mp3","when i say we are done"},
	{'whathaveidone'  ,SESpath .."Emotes/whathaveidone.mp3","what have i done"},
	{'whathaveidone2'  ,SESpath .."Emotes/whathaveidone2.mp3","what have i done2"},
	{'pour'  ,SESpath .."Emotes/pour.mp3","when i drip i pour"},
	{'chickennuggets'  ,SESpath .."Emotes/chickennuggets.mp3","meine chicken nuggets"},
	{'duel'  ,SESpath .."Emotes/duel.mp3","yugioh"},
	{'duel2'  ,SESpath .."Emotes/duel2.mp3","yugioh"},
	{'omaewamou'  ,SESpath .."Emotes/omaewamou.mp3","omae wa mou"},
	{'naruto1'  ,SESpath .."Emotes/naruto1.mp3","naruto fight"},
	{'rasengan'  ,SESpath .."Emotes/rasengan.mp3","rasengan"},
	{'rasengan2'  ,SESpath .."Emotes/rasengan2.mp3","rasengan2"},
	{'naruto2'  ,SESpath .."Emotes/naruto2.mp3","naruto sad"},
	{'jutsu'  ,SESpath .."Emotes/jutsu.mp3","jutsu"},
	{'jutsu2'  ,SESpath .."Emotes/jutsu2.mp3","jutsu2"},
	{'jpn'  ,SESpath .."Emotes/jpn.mp3","jpn"},
	{'akatsuki'  ,SESpath .."Emotes/akatsuki.mp3","akatsuki"},
	{'amaterasu'  ,SESpath .."Emotes/amaterasu.mp3","amaterasu"},
	{'baka'  ,SESpath .."Emotes/baka.mp3","baka"},
	{'bankai'  ,SESpath .."Emotes/bankai.mp3","bankai"},
	{'byakugan'  ,SESpath .."Emotes/byakugan.mp3","byakugan"},
	{'chidori'  ,SESpath .."Emotes/chidori.mp3","chidori "},
	{'chidori2'  ,SESpath .."Emotes/chidori2.mp3","chidori2"},
	{'dattebayo'  ,SESpath .."Emotes/dattebayo.mp3","dattebayo"},
	{'dragon'  ,SESpath .."Emotes/dragon.mp3","dragon"},
	{'getsuga'  ,SESpath .."Emotes/getsuga.mp3","getsuga"},
	{'hashineo'  ,SESpath .."Emotes/hashineo.mp3","hashineo"},
	{'jotaro'  ,SESpath .."Emotes/jotaro.mp3","jotaro"},
	{'katon'  ,SESpath .."Emotes/katon.mp3","katon"},
	{'konodio'  ,SESpath .."Emotes/konodio.mp3","konodio"},
	{'majestic'  ,SESpath .."Emotes/majestic.mp3","majestic demolisher"},
	{'mangekyou'  ,SESpath .."Emotes/mangekyou.mp3","mangekyou sharingan"},
	{'mindtransfer'  ,SESpath .."Emotes/mindtransfer.mp3","mindtransfer jutsu"},
	{'poof'  ,SESpath .."Emotes/poof.mp3","substitute jutsu"},
	{'rasenringu'  ,SESpath .."Emotes/rasenringu.mp3","rasenringu"},
	{'requiem'  ,SESpath .."Emotes/requiem.mp3","requiem"},
	{'rinnegan'  ,SESpath .."Emotes/rinnegan.mp3","rinnegan"},
	{'sekaini'  ,SESpath .."Emotes/sekaini.mp3","sekaini tamiu"},
	{'senpo'  ,SESpath .."Emotes/senpo.mp3","toad oil"},
	{'sharingan'  ,SESpath .."Emotes/sharingan.mp3","sharingan"},
	{'shark'  ,SESpath .."Emotes/shark.mp3","shark jutsu"},
	{'shinra'  ,SESpath .."Emotes/shinra.mp3","shinra"},
	{'spider'  ,SESpath .."Emotes/spider.mp3","spider"},
	{'teshisendan'  ,SESpath .."Emotes/teshisendan.mp3","teshisendan"},
	{'todoroki'  ,SESpath .."Emotes/todoroki.mp3","todoroki"},
	{'tp'  ,SESpath .."Emotes/tp.mp3","tp"},
	{'watermissile'  ,SESpath .."Emotes/watermissile.mp3","watermissile"},
	{'wave'  ,SESpath .."Emotes/wave.mp3","wave"},
	{'yoooo'  ,SESpath .."Emotes/yoooo.mp3","yoooo"},
	





	{'gfy'		,SESpath .. "Triggers/Triggered/gofyourself.mp3","Go F*K yourself"},
	{'scrm'		,SESpath .."Emotes/level9scream.mp3","Scream"},
	{'1v1'		,SESpath .."Emotes/oneonone.mp3","1v1 me B*tches"},
	{'epic'		,SESpath .."Emotes/epicspeech.mp3","Epic Loot Event"},
	{'gkick'	,SESpath .."Emotes/gkick.mp3","Guild Kick"},







	-------~*~*~*~*~*~*~**~*~----------
	--jas
	{'jhah'	,SESpath .."Emotes/JayHah.mp3","Short Ha"},
	{'oyb'	,SESpath .."Emotes/megaohyeababy.mp3","Oh Yea baby"},
	{'ayd'	,SESpath .."Emotes/awhyeadaddy.mp3","Ah Yea daddy"},
	{'yas'	,SESpath .."Emotes/Yahs.mp3","Yesh"},
	{'ynmm'	,SESpath .."Emotes/yourenotmymom.mp3","Your not my mom"},
	{'wwm'	,SESpath .."Emotes/whatswrongwithme.mp3","What is wrong"},
	{'bit'	,SESpath .."Emotes/bches.mp3","B*tches"},
	{'augh'	,SESpath .."Emotes/augh.mp3","Aughh"},
	{'sad'	,SESpath .."Emotes/makesmesad.mp3","That makes me sad"},
	{'ughh'	,SESpath .."Emotes/megaugh.mp3","Ughhh"},
	{'nailed'	,SESpath .."Emotes/nailedit.mp3","Nailed it"},
	
	-------~*~*~*~*~*~*~**~*~----------
	--CLIFF
	{'obey'	,SESpath .."Emotes/tentacleoverlords.mp3","Obey tentacle lords"},
	{'backup'	,SESpath .."Emotes/wheresmybackup.mp3","Where's my backup"},

	-------~*~*~*~*~*~*~**~*~----------
	--Fred

	-------~*~*~*~*~*~*~**~*~----------
	--andrw
	{'cookie'	,SESpath .."Emotes/forthecookie.mp3","For the Cookie"},

	-------~*~*~*~*~*~*~**~*~----------
	--Joey
	{'needhelp'	,SESpath .."Emotes/ineedhelp.mp3","I need help"},
	{'wow'	,SESpath .."Emotes/wowow.mp3","wow^7"},
	{'huh'	,SESpath .."Emotes/whuh.mp3","Huh?"},

	-------~*~*~*~*~*~*~**~*~----------
	--misc
	{'fall'	,SESpath .."Emotes/fallingasleep.mp3","Smack Noise"},
	{'ngl'	,SESpath .."Emotes/notgettinglaid.mp3","Not getting laid"},
	{'trap'	,SESpath .."Emotes/itsatrap.mp3","Its a trap!"},
	{'fap'	,SESpath .."Emotes/savagefap.mp3","Auugh auugh auugh"},
	{'dundun'	,SESpath .."Emotes/dundundun.mp3","Dun dun \/ dunnn"},
	{'triple'	,SESpath .."Emotes/triple.mp3","Oh Baby a Tripple"},
	{'turtles'	,SESpath .."Emotes/turtles.mp3","I <3 Turtles"},
	
	

}
