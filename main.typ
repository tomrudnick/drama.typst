#import "drama.typ": setupDrama, act, regie, scene-description, inline-regie, scene, regie-table

#let drama = "Emilia Galotti"
#let author = "Gotthold Ephraim Lessing"
#let paper = "a5"


#let (character-table, 
character-speaks, 
character-dict, 
character-print-dict,
template) = {

  let emilia = (full: "Emilia Galotti", short: "Emilia")
  let appiani = (full: "Graf Appiani", short: "Appiani")
  let orsina = (full: "Gräfin Orsina", short: "Orsina")
  let angelo = (full: "Angelo")
  let kammerdiener = (full: "Der Kammerdiener")
  let marinelli = (full: "Marinelli")
  let odoardo = (full: "Odoardo Galotti", short: "Odoardo")
  let claudia = (full: "Claudia Galotti", short: "Claudia")
  let prinz = (full: "Hettore Gonzaga", short: "Der Prinz")
  let conti = (full: "Conti")
  let camillo = (full: "Camillo Rota", short: "Camillo")
  
  setupDrama(
    title: drama,
    paper: paper,
    characters: 
    (
      (description: "", characters: (emilia)),
      (description: "Eltern der Emilia", characters: (odoardo, claudia)),
      (description: "Prinz von Guastalla", characters: (prinz)),
      (description: "Kammerherr des Prinzen", characters: (marinelli)),
      (description: "einer von des Prinzen Räten", characters: (camillo)),
      (description: "Maler",  characters: (conti)),
      (description: "", characters: (appiani, orsina, angelo, kammerdiener))
    )
  )
}


#let conti = character-print-dict.conti
#let prinz = character-print-dict.der-prinz
#let marinelli = character-print-dict.marinelli
#let kammerdiener = character-print-dict.der-kammerdiener
#let camillo = character-print-dict.camillo
#let prinzsays = character-speaks.der-prinz
#let kammerdienersays = character-speaks.der-kammerdiener
#let contisays = character-speaks.conti
#let marinellisays = character-speaks.marinelli
#let camillosays = character-speaks.camillo

#page(paper: paper, align(center + horizon)[
  #text(2em)[*#drama*]
  #v(2em, weak: true)
  #text(1.6em, author)
])

#page(paper: paper, align(center)[
  Dies eine Demonstration des _Drama_ Template in Typst.\
  Das vorliegende Werk ist gemeinfrei.\
  Getippt von Tom Rudnick.
])

#let scene-characters(characters) = {
  align(center)[
    #if type(characters) == array {
      characters.join(", ")
    } else {
      characters
    }
  ]
}

#show: template

#align(center)[ = Personen]
#v(5pt)
#character-table()
#pagebreak()

#act("Erster Aufzug")[
  #scene("Erster Auftritt")[
    #scene-description[
      #scene-characters((prinz, kammerdiener))
      #regie[Ein Kabinett des Prinzen.]
    ]
    #prinzsays(instructio: "(an einem Arbeitstische voller Briefschaften und Papiere, deren einige er durchläuft)")[
      Klagen, nichts als Klagen! Bittschriften, nichts als Bittschriften! --- Die traurigen Geschäfte; und man beneidet
      uns noch! --- Das glaub ich; wenn wir allen helfen könnten:
      dann wären wir zu beneiden. --- Emilia? #inline-regie[Indem er noch eine von den Bittschriften aufschlägt und nach dem unterschriebenen Namen sieht.] Eine Emilia? --- Aber eine Emilia Bruneschi --- nicht Galotti. Nicht Emilia Galotti! --- Was will sie, diese Emilia Bruneschi? #inline-regie[Er lieset.] Viel gefodert, sehr viel. --- Doch sie heißt Emilia. Gewährt! #inline-regie[Er unterschreibt und klingelt, worauf ein Kammerdiener hereintritt.] Es ist wohl noch keiner von den Räten in dem Vorzimmer?
    ]
    #kammerdienersays[Nein.]
    #prinzsays[Ich habe zu früh Tag gemacht. --- Der Morgen ist so schön. Ich will ausfahren. Marchese Marinelli soll mich begleiten. Laßt ihn rufen. #inline-regie[Der Kammerdiener geht ab.] --- Ich kann doch nicht mehr arbeiten. --- Ich war so ruhig, bild ich mir ein, so ruhig --- Auf einmal muß eine arme Bruneschi Emilia heißen: --- weg ist meine Ruhe, und alles! --- #inline-regie[Der Kammerdiener, welcher wieder hereintritt.]
    Nach dem Marchese ist geschickt. Und hier, ein Brief von der Gräfin Orsina.
    ]
    #prinzsays[
      Der Orsina? Legt ihn hin.
    ]
    #kammerdienersays[
      Ihr Läufer wartet.
    ]
    #prinzsays[
      Ich will die Antwort senden; wenn es einer bedarf. --- Wo ist sie? In der Stadt? oder auf ihrer Villa?
    ]
    #kammerdienersays[
      Sie ist gestern in die Stadt gekommen.
    ]
    #prinzsays[
      Desto schlimmer --- besser, wollt' ich sagen. So braucht der Läufer um so weniger zu warten. #inline-regie[Der Kammerdiener geht ab.] Meine teure Gräfin! #inline-regie[bitter, indem er den Brief in die Hand nimmt]
      So gut, als gelesen!
      #inline-regie[Er wirft ihn wieder weg.]
      Nun ja; ich habe sie zu lieben geglaubt! Was glaubt man nicht alles? Kann sein, ich habe sie auch wirklich geliebt. Aber --- ich habe!
    ]
    #kammerdienersays(instructio: ("Der Kammerdiener tritt nochmals herein."))[
      Der Maler Conti will die Gnade haben ---
    ]
    #prinzsays[
      Conti? Recht wohl; laßt ihn hereinkommen. --- Das wird mir andere Gedanken in den Kopf bringen. #inline-regie[Er steht auf.]
    ]
  ]

  #scene("Zweiter Auftritt")[
    #scene-characters((prinz, conti))
    #prinzsays[Guten Morgen, Conti. Wie leben Sie? Was macht die Kunst?]
    #contisays[Prinz, die Kunst geht nach Brot.]
    #prinzsays[Das muß sie nicht; das soll sie nicht---in meinem kleinen Gebiete gewiß nicht.---Aber der Künstler muß auch arbeiten wollen.]
    #contisays[
      Arbeiten? Das ist seine Lust. Nur zu viel arbeiten müssen kann ihn um den Namen Künstler bringen.
    ]
    #prinzsays[
      Ich meine nicht vieles, sondern viel; ein Weniges, aber mit Fleiß. --- Sie kommen doch nicht leer, Conti?
    ]
    #contisays[
      Ich bringe das Porträt, welches Sie mir befohlen haben, gnädiger Herr. Und bringe noch eines, welches Sie mir nicht befohlen: aber weil es gesehen zu werden verdient.
    ]
    #prinzsays[Jenes ist? --- Kann ich mich doch kaum erinnern.]
    #contisays[Die Gräfin Orsina.]
    #prinzsays[Wahr! --- Der Auftrag ist nur ein wenig von lange her.]
    #contisays[
      Unsere schönen Damen sind nicht alle Tage zum Malen. Die Gräfin hat, seit drei Monaten, gerade ein Mal sich entschließen können zu sitzen.
    ]
    #prinzsays[Wo sind die Stücke?]
    #contisays[In dem Vorzimmer, ich hole sie. #inline-regie[Conti geht ab.]]
  ]
  #scene("Dritter Auftritt")[
    #scene-characters(prinz)
    #prinzsays[
      Ihr Bild! --- mag! --- Ihr Bild, ist sie doch nicht selber. --- Und vielleicht find ich in dem Bilde wieder, was ich in der Person nicht mehr erblicke. --- Ich will es aber nicht wiederfinden. --- Der beschwerliche Maler! Ich glaube gar, sie hat ihn bestochen. --- Wär’ es auch! Wenn ihr ein anderes Bild, das mit andern Farben, auf einen andern Grund gemalet ist --- in meinem Herzen wieder Platz machen will: --- Wahrlich, ich glaube, ich wär’ es zufrieden. Als ich dort liebte, war ich immer so leicht, so fröhlich, so ausgelassen. --- Nun bin ich von allem das Gegenteil. --- Doch nein; nein, nein! Behäglicher oder nicht behäglicher: ich bin so besser.
    ]
  ]

  #scene("Vierter Auftritt")[
    #scene-characters((prinz, conti))
    #contisays(instructio: "indem er das andere zurechtstellet")[
      Ich bitte, Prinz, daß Sie die Schranken unserer Kunst erwägen wollen. Vieles von dem Anzüglichsten der Schönheit liegt ganz außer den Grenzen derselben. --- Treten Sie so!
    ]
    #prinzsays[
      --- Vortrefflich, Conti --- ganz vortrefflich! --- Das gilt Ihrer Kunst, Ihrem Pinsel. --- Aber geschmeichelt, Conti; ganz unendlich geschmeichelt!
    ]
    #contisays[
      Das Original schien dieser Meinung nicht zu sein. Auch ist es in der Tat nicht mehr geschmeichelt, als die Kunst schmeicheln muß. Die Kunst muß malen, wie sich die plastische Natur --- wenn es eine gibt --- das Bild dachte: ohne den Abfall, welchen der widerstrebende Stoff unvermeidlich macht; ohne den Verderb, mit welchem die Zeit dagegen ankämpfet.
    ]
    #prinzsays[
      Der denkende Künstler ist noch eins soviel wert. --- Aber das Original, sagen Sie, fand demungeachtet...
    ]
    #contisays[
      Verzeihen Sie, Prinz. Das Original ist eine Person, die meine Ehrerbietung fodert. Ich habe nichts Nachteiliges von ihr äußern wollen.
    ]
    #prinzsays[
      Soviel als Ihnen beliebt! --- Und was sagte das Original?
    ]
    #contisays[
      Ich bin zufrieden, sagte die Gräfin, wenn ich nicht häßlicher aussehe.
    ]
    #prinzsays[
      Nicht häßlicher? --- O das wahre Original!
    ]
    #contisays[
      Und mit einer Miene sagte sie das --- von der freilich dieses ihr Bild keine Spur, keinen Verdacht zeiget.
    ]
    #prinzsays[
      Das meint' ich ja; das ist es eben, worin ich die unendliche Schmeichelei finde. --- Oh! ich kenne sie, jene stolze, höhnische Miene, die auch das Gesicht einer Grazie entstellen würde! --- Ich leugne nicht, daß ein schöner Mund, der sich ein wenig spöttisch verziehet, nicht selten um so viel schöner ist. Aber, wohl gemerkt, ein wenig: die Verziehung muß nicht bis zur Grimasse gehen, wie bei dieser Gräfin. Und Augen müssen über den wollüstigen Spötter die Aufsicht führen --- Augen, wie sie die gute Gräfin nun gerade gar nicht hat. Auch nicht einmal hier im Bilde hat.
    ]
    #contisays[
      Gnädiger Herr, ich bin äußerst betroffen.
    ]
    #prinzsays[
      Und worüber? Alles, was die Kunst aus den großen, hervorragenden, stieren, starren Medusenaugen der Gräfin Gutes machen kann, das haben Sie, Conti, redlich daraus gemacht. --- Redlich, sag ich? --- Nicht so redlich, wäre redlicher. Denn sagen Sie selbst, Conti, läßt sich aus diesem Bilde wohl der Charakter der Person schließen? Und das sollte doch. Stolz haben Sie in Würde, Hohn in Lächeln, Ansatz zu trübsinniger Schwärmerei in sanfte Schwermut verwandelt.
    ]
    #contisays(instructio: "(etwas ärgerlich)")[
      Ah, mein Prinz --- wir Maler rechnen darauf, daß das fertige Bild den Liebhaber noch ebenso warm findet, als warm er es bestellte. Wir malen mit Augen der Liebe: und Augen der Liebe müßten uns auch nur beurteilen.
    ]
    #prinzsays[
      Je nun, Conti --- warum kamen Sie nicht einen Monat früher damit? --- Setzen Sie weg. --- Was ist das andere Stück?
    ]
    #contisays[
      (indem er es holt und noch verkehrt in der Hand hält) Auch ein weibliches Porträt.
    ]
    #prinzsays[
      So möcht' ich es bald --- lieber gar nicht sehen. Denn dem Ideal hier --- oder vielmehr hier --- kömmt es doch nicht bei. --- Ich wünschte, Conti, Ihre Kunst in andern Vorwürfen zu bewundern.
    ]
    #contisays[
      Eine bewundernswürdigere Kunst gibt es, aber sicherlich keinen bewundernswürdigern Gegenstand als diesen.
    ]
    #prinzsays[
      So wett ich, Conti, daß es des Künstlers eigene Gebieterin ist. --- #inline-regie[Indem der Maler das Bild umwendet.] Was seh ich? Ihr Werk, Conti? oder das Werk meiner Phantasie? --- Emilia Galotti!
    ]
    #contisays[
      Wie, mein Prinz? Sie kennen diesen Engel?
    ]
    #prinzsays[
      --- So halb! --- um sie eben wiederzukennen. --- Es ist einige Wochen her, als ich sie mit ihrer Mutter in einer Vegghia traf. --- Nachher ist sie mir nur an heiligen Stätten wieder vorgekommen --- wo das Angaffen sich weniger ziemet. --- Auch kenn ich ihren Vater. Er ist mein Freund nicht. Er war es, der sich meinen Ansprüchen auf Sabionetta am meisten widersetzte. --- Ein alter Degen, stolz und rauh, sonst bieder und gut!
    ]
    #contisays[
      Der Vater! Aber hier haben wir seine Tochter.
    ]
    #prinzsays[
      Bei Gott! wie aus dem Spiegel gestohlen! --- #inline-regie[Noch immer die Augen auf das Bild geheftet] Oh, Sie wissen es ja wohl, Conti, daß man den Künstler dann erst recht lobt, wenn man über sein Werk sein Lob vergißt.
    ]
    #contisays[
      Gleichwohl hat mich dieses noch sehr unzufrieden mit mir gelassen. --- Und doch bin ich wiederum sehr zufrieden mit meiner Unzufriedenheit mit mir selbst. --- Ha! daß wir nicht unmittelbar mit den Augen malen! Auf dem langen Wege, aus dem Auge durch den Arm in den Pinsel, wieviel geht da verloren! --- Aber, wie ich sage, daß ich es weiß, was hier verlorengegangen und wie es verlorengegangen und warum es verlorengehen müssen: darauf bin ich ebenso stolz und stolzer, als ich auf alles das bin, was ich nicht verlorengehen lassen. Denn aus jenem erkenne ich, mehr als aus diesem, daß ich wirklich ein großer Maler bin, daß es aber meine Hand nur nicht immer ist. --- Oder meinen Sie, Prinz, daß Raffael nicht das größte malerische Genie gewesen wäre, wenn er unglücklicherweise ohne Hände wäre geboren worden? Meinen Sie, Prinz?
    ]
    #prinzsays(instructio: "(indem er nur eben von dem Bilde wegblickt)")[
      Was sagen Sie, Conti? Was wollen Sie wissen?
    ]
    #contisays[
      O nichts, nichts! --- Plauderei! Ihre Seele, merk ich, war ganz in Ihren Augen. Ich liebe solche Seelen und solche Augen.
    ]
    #prinzsays[
      (mit einer erzwungenen Kälte) Also, Conti, rechnen Sie doch wirklich Emilia Galotti mit zu den vorzüglichsten Schönheiten unserer Stadt?
    ]
    #contisays[
      Also? mit? mit zu den vorzüglichsten? und den vorzüglichsten unserer Stadt? --- Sie spotten meiner, Prinz. Oder Sie sahen die ganze Zeit ebensowenig, als Sie hörten.
    ]
    #prinzsays[
      Lieber Conti --- #inline-regie[die Augen wieder auf das Bild gerichtet,] wie darf unsereiner seinen Augen trauen? Eigentlich weiß doch nur allein ein Maler von der Schönheit zu urteilen.
    ]
    #contisays[
      Und eines jeden Empfindung sollte erst auf den Ausspruch eines Malers warten? --- Ins Kloster mit dem, der es von uns lernen will, was schön ist! Aber das muß ich Ihnen doch als Maler sagen, mein Prinz: eine von den größten Glückseligkeiten meines Lebens ist es, daß Emilia Galotti mir gesessen. Dieser Kopf, dieses Antlitz, diese Stirne, diese Augen, diese Nase, dieser Mund, dieses Kinn, dieser Hals, diese Brust, dieser Wuchs, dieser ganze Bau, sind, von der Zeit an, mein einziges Studium der weiblichen Schönheit. --- Die Schilderei selbst, wovor sie gesessen, hat ihr abwesender Vater bekommen. Aber diese Kopie.
    ]
    #prinzsays(instructio: "(der sich schnell gegen ihn kehret)")[
      Nun, Conti? ist doch nicht schon versagt?
    ]
    #contisays[
      Ist für Sie, Prinz, wenn Sie Geschmack daran finden.
    ]
    #prinzsays[
      Geschmack! --- #inline-regie[Lächelnd.] Dieses Ihr Studium der weiblichen Schönheit, Conti, wie könnt' ich besser tun, als es auch zu dem meinigen zu machen? --- Dort, jenes Porträt nehmen Sie nur wieder mit --- einen Rahmen darum zu bestellen.
    ]
    #contisays[
      Wohl!
    ]
    #prinzsays[
      So schön, so reich, als ihn der Schnitzer nur machen kann.
      Es soll in der Galerie aufgestellet werden.---Aber dieses bleibt hier.
      Mit einem Studio macht man soviel Umstände nicht: auch läßt man das
      nicht aufhängen, sondern hat es gern bei der Hand.---Ich danke Ihnen,
      Conti; ich danke Ihnen recht sehr.---Und wie gesagt: in meinem Gebiete
      soll die Kunst nicht nach Brot gehen---bis ich selbst keines habe.
      ---Schicken Sie, Conti, zu meinem Schatzmeister, und lassen Sie, auf
      Ihre Quittung, für beide Porträte sich bezahlen---was Sie wollen.
      Soviel Sie wollen, Conti.
    ]
    #contisays[
      Sollte ich doch nun bald fürchten, Prinz, daß Sie so noch etwas anders belohnen wollen als die Kunst.
    ]
    #prinzsays[
      O des eifersüchtigen Künstlers! Nicht doch---Hören Sie,
      Conti; soviel Sie wollen. #inline-regie[Conti geht ab.]
    ]
  ]
  #scene("Fünfter Auftritt")[
    #scene-characters(prinz)
    #prinzsays[
      --- Soviel er will! #inline-regie[Gegen das Bild.] Dich hab ich für jeden Preis noch zu wohlfeil. --- Ah! schönes Werk der Kunst, ist es wahr, daß ich dich besitze? --- Wer dich auch besäße, schönres Meisterstück der Natur! --- Was Sie dafür wollen, ehrliche Mutter! Was du willst, alter Murrkopf! Fodre nur! Fodert nur! --- Am liebsten kauft' ich dich, Zauberin, von dir selbst! --- Dieses Auge voll Liebreiz und Bescheidenheit! Dieser Mund! --- Und wenn er sich zum Reden öffnet! wenn er lächelt! Dieser Mund! --- Ich höre kommen. --- Noch bin ich mit dir zu neidisch. #inline-regie[Indem er das Bild gegen die Wand drehet.] Es wird Marinelli sein. Hätt' ich ihn doch nicht rufen lassen! Was für einen Morgen könnt' ich haben!
    ]
  ]
  #scene("Sechster Auftritt")[
    #scene-characters((marinelli, prinz))
    #marinellisays[
      Gnädiger Herr, Sie werden verzeihen. --- Ich war mir eines so frühen Befehls nicht gewärtig.
    ]
    #prinzsays[
      Ich bekam Lust, auszufahren. Der Morgen war so schön. --- Aber nun ist er ja wohl verstrichen; und die Lust ist mir vergangen. --- #inline-regie[Nach einem kurzen Stillschweigen.] Was haben wir Neues, Marinelli?
    ]
    #marinellisays[
      Nichts von Belang, das ich wüßte. --- Die Gräfin Orsina ist gestern zur Stadt gekommen.
    ]
    #prinzsays[
      Hier liegt auch schon ihr guter Morgen #inline-regie[auf ihren Brief zeigend] oder was es sonst sein mag! Ich bin gar nicht neugierig darauf. --- Sie haben sie gesprochen?
    ]
    #marinellisays[
      Bin ich, leider, nicht ihr Vertrauter? --- Aber, wenn ich es wieder von einer Dame werde, der es einkömmt, Sie in gutem Ernste zu lieben, Prinz: so.
    ]
    #prinzsays[
      Nichts verschworen, Marinelli!
    ]
    #marinellisays[
      Ja? In der Tat, Prinz? Könnt' es doch kommen? --- Oh! so mag die Gräfin auch so unrecht nicht haben.
    ]
    #prinzsays[
      Allerdings, sehr unrecht! --- Meine nahe Vermählung mit der Prinzessin von Massa will durchaus, daß ich alle dergleichen Händel fürs erste abbreche.
    ]
    #marinellisays[
      Wenn es nur das wäre: so müßte freilich Orsina sich in ihr Schicksal ebensowohl zu finden wissen als der Prinz in seines.
    ]
    #prinzsays[
      Das unstreitig härter ist als ihres. Mein Herz wird das Opfer eines elenden Staatsinteresse. Ihres darf sie nur zurücknehmen, aber nicht wider Willen verschenken.
    ]
    #marinellisays[
      Zurücknehmen? Warum zurücknehmen? fragt die Gräfin: wenn es weiter nichts als eine Gemahlin ist, die dem Prinzen nicht die Liebe, sondern die Politik zuführet? Neben so einer Gemahlin sieht die Geliebte noch immer ihren Platz. Nicht so einer Gemahlin fürchtet sie aufgeopfert zu sein, sondern ---
    ]
    #prinzsays[
      Einer neuen Geliebten. --- Nun denn? Wollten Sie mir daraus ein Verbrechen machen, Marinelli?
    ]
    #marinellisays[
      Ich? --- Oh! vermengen Sie mich ja nicht, mein Prinz, mit der Närrin, deren Wort ich führe --- aus Mitleid führe. Denn gestern, wahrlich, hat sie mich sonderbar gerühret. Sie wollte von ihrer Angelegenheit mit Ihnen gar nicht sprechen. Sie wollte sich ganz gelassen und kalt stellen. Aber mitten in dem gleichgültigsten Gespräche entfuhr ihr eine Wendung, eine Beziehung über die andere, die ihr gefoltertes Herz verriet. Mit dem lustigsten Wesen sagte sie die melancholischsten Dinge: und wiederum die lächerlichsten Possen mit der allertraurigsten Miene. Sie hat zu den Büchern ihre Zuflucht genommen; und ich fürchte, die werden ihr den Rest geben.
    ]
    #prinzsays[
      So wie sie ihrem armen Verstande auch den ersten Stoß gegeben. --- Aber was mich vornehmlich mit von ihr entfernt hat, das wollen Sie doch nicht brauchen, Marinelli, mich wieder zu ihr zurückzubringen? --- Wenn sie aus Liebe närrisch wird, so wäre sie es, früher oder später, auch ohne Liebe geworden --- Und nun, genug von ihr. --- Von etwas andern! --- Geht denn gar nichts vor in der Stadt?
    ]
    #marinellisays[
      So gut wie gar nichts. --- Denn daß die Verbindung des Grafen Appiani heute vollzogen wird --- ist nicht viel mehr als gar nichts.
    ]
    #prinzsays[
      Des Grafen Appiani? und mit wem denn? --- Ich soll ja noch hören, daß er versprochen ist.
    ]
    #marinellisays[
      Die Sache ist sehr geheimgehalten worden. Auch war nicht viel Aufhebens davon zu machen. --- Sie werden lachen, Prinz. --- Aber so geht es den Empfindsamen! Die Liebe spielet ihnen immer die schlimmsten Streiche. Ein Mädchen ohne Vermögen und ohne Rang hat ihn in ihre Schlinge zu ziehen gewußt --- mit ein wenig Larve, aber mit vielem Prunke von Tugend und Gefühl und Witz --- und was weiß ich?
    ]
    #prinzsays[
      Wer sich den Eindrücken, die Unschuld und Schönheit auf ihn machen, ohne weitere Rücksicht, so ganz überlassen darf --- ich dächte, der wäre eher zu beneiden als zu belachen. --- Und wie heißt denn die Glückliche? Denn bei alledem ist Appiani --- ich weiß wohl, daß Sie, Marinelli, ihn nicht leiden können; ebensowenig als er Sie --- , bei alledem ist er doch ein sehr würdiger junger Mann, ein schöner Mann, ein reicher Mann, ein Mann voller Ehre. Ich hätte sehr gewünscht, ihn mir verbinden zu können. Ich werde noch darauf denken.
    ]
    #marinellisays[
      Wenn es nicht zu spät ist. --- Denn soviel ich höre, ist sein Plan gar nicht, bei Hofe sein Glück zu machen. --- Er will mit seiner Gebieterin nach seinen Tälern von Piemont --- Gemsen zu jagen, auf den Alpen, und Murmeltiere abzurichten. --- Was kann er Besseres tun? Hier ist es durch das Mißbündnis, welches er trifft, mit ihm doch aus. Der Zirkel der ersten Häuser ist ihm von nun an verschlossen.
    ]
    #prinzsays[
      Mit euren ersten Häusern! --- in welchen das Zeremoniell, der Zwang, die Langeweile und nicht selten die Dürftigkeit herrschet. --- Aber so nennen Sie mir sie doch, der er dieses so große Opfer bringt.
    ]
    #marinellisays[
      Es ist eine gewisse Emilia Galotti.
    ]
    #prinzsays[
      Wie, Marinelli? eine gewisse.
    ]
    #marinellisays[
      Emilia Galotti.
    ]
    #prinzsays[
      Emilia Galotti? --- Nimmermehr!
    ]
    #marinellisays[
      Zuverlässig, gnädiger Herr.
    ]
    #prinzsays[
      Nein, sag ich; das ist nicht, das kann nicht sein. --- Sie irren sich in dem Namen. --- Das Geschlecht der Galotti ist groß. --- Eine Galotti kann es sein: aber nicht Emilia Galotti, nicht Emilia!
    ]
    #marinellisays[
      Emilia --- Emilia Galotti!
    ]
    #prinzsays[
      So gibt es noch eine, die beide Namen führt. --- Sie sagten ohnedem, eine gewisse Emilia Galotti --- eine gewisse. Von der rechten kann nur ein Narr so sprechen.
    ]
    #marinellisays[
      Sie sind außer sich, gnädiger Herr. --- Kennen Sie denn diese Emilia?
    ]
    #prinzsays[
      Ich habe zu fragen, Marinelli, nicht Er. --- Emilia Galotti? Die Tochter des Obersten Galotti, bei Sabionetta?
    ]
    #marinellisays[
      Ebendie.
    ]
    #prinzsays[
      Die hier in Guastalla mit ihrer Mutter wohnet?
    ]
    #marinellisays[
      Ebendie.
    ]
    #prinzsays[
      Unfern der Kirche Allerheiligen?
    ]
    #marinellisays[
      Ebendie.
    ]
    #prinzsays[
      Mit einem Worte --- #inline-regie[Indem er nach dem Porträte springt und es dem Marinelli in die Hand gibt.] Da! --- Diese? Diese Emilia Galotti? --- Sprich dein verdammtes "Ebendie" noch einmal und stoß mir den Dolch ins Herz!
    ]
    #marinellisays[
      Ebendie!
    ]
    #prinzsays[
      Henker! --- Diese? --- Diese Emilia Galotti wird heute.
    ]
    #marinellisays[
      Gräfin Appiani! --- #inline-regie[Hier reißt der Prinz dem Marinelli das Bild wieder aus der Hand und wirft es beiseite.] Die Trauung geschiehet in der Stille, auf dem Landgute des Vaters bei Sabionetta. Gegen Mittag fahren Mutter und Tochter, der Graf und vielleicht ein paar Freunde dahin ab.
    ]
    #prinzsays(instructio: "(der sich voll Verzweiflung in einen Stuhl wirf)")[
      So bin ich verloren! --- So will ich nicht leben!
    ]
    #marinellisays[
      Aber was ist Ihnen, gnädiger Herr?
    ]
    #prinzsays(instructio: "(der gegen ihn wieder aufspringt)")[
      Verräter! --- was mir ist? --- Nun ja, ich liebe sie; ich bete sie an. Mögt ihr es doch wissen! Mögt ihr es doch längst gewußt haben, alle ihr, denen ich der tollen Orsina schimpfliche Fesseln lieber ewig tragen sollte! --- Nur daß Sie, Marinelli, der Sie so oft mich Ihrer innigsten Freundschaft versicherten --- O ein Fürst hat keinen Freund! kann keinen Freund haben! --- , daß Sie, Sie, so treulos, so hämisch mir bis auf diesen Augenblick die Gefahr verhehlen dürfen, die meiner Liebe drohte: wenn ich Ihnen jemals das vergebe --- so werde mir meiner Sünden keine vergeben!
    ]
    #marinellisays[
      Ich weiß kaum Worte zu finden, Prinz --- wenn Sie mich auch dazu kommen ließen --- , Ihnen mein Erstaunen zu bezeigen. --- Sie lieben Emilia Galotti! --- Schwur dann gegen Schwur: Wenn ich von dieser Liebe das geringste gewußt, das geringste vermutet habe, so möge weder Engel noch Heiliger von mir wissen! --- Ebendas wollt' ich in die Seele der Orsina schwören. Ihr Verdacht schweift auf einer ganz andern Fährte.
    ]
    #prinzsays(instructio: "(indem er sich ihm in die Arme wirft)")[
      So verzeihen Sie mir, Marinelli --- und bedaueren Sie mich.
    ]
    #marinellisays[
      Nun da, Prinz! Erkennen Sie da die Frucht Ihrer Zurückhaltung! --- "Fürsten haben keinen Freund! können keinen Freund haben!" --- Und die Ursache, wenn dem so ist? --- Weil sie keinen haben wollen. --- Heute beehren sie uns mit ihrem Vertrauen, teilen uns ihre geheimsten Wünsche mit, schließen uns ihre ganze Seele auf: und morgen sind wir ihnen wieder so fremd, als hätten sie nie ein Wort mit uns gewechselt.
    ]
    #prinzsays[
      Ah! Marinelli, wie konnt' ich Ihnen vertrauen, was ich mir selbst kaum gestehen wollte?
    ]
    #marinellisays[
      Und also wohl noch weniger der Urheberin Ihrer Qual gestanden haben?
    ]
    #prinzsays[
      Ihr? --- Alle meine Mühe ist vergebens gewesen, sie ein zweites Mal zu sprechen.
    ]
    #marinellisays[
      Und das erstemal.
    ]
    #prinzsays[
      Sprach ich sie --- Oh, ich komme von Sinnen! Und ich soll Ihnen noch lange erzählen? --- Sie sehen mich einen Raub der Wellen: was fragen Sie viel, wie ich es geworden? Retten Sie mich, wenn Sie können: und fragen Sie dann.
    ]
    #marinellisays[
      Retten? ist da viel zu retten? --- Was Sie versäumt haben, gnädiger Herr, der Emilia Galotti zu bekennen, das bekennen Sie nun der Gräfin Appiani. Waren, die man aus der ersten Hand nicht haben kann, kauft man aus der zweiten: --- und solche Waren nicht selten aus der zweiten um so viel wohlfeiler.
    ]
    #prinzsays[
      Ernsthaft, Marinelli, ernsthaft, oder ---
    ]
    #marinellisays[
      Freilich, auch um so viel schlechter.
    ]
    #prinzsays[
      Sie werden unverschämt!
    ]
    #marinellisays[
      Und dazu will der Graf damit aus dem Lande. --- Ja, so müßte man auf etwas anders denken.
    ]
    #prinzsays[
      Und auf was? --- Liebster, bester Marinelli, denken Sie für mich. Was würden Sie tun, wenn Sie an meiner Stelle wären?
    ]
    #marinellisays[
      Vor allen Dingen eine Kleinigkeit als eine Kleinigkeit ansehen --- und mir sagen, daß ich nicht vergebens sein wolle, was ich bin --- Herr!
    ]
    #prinzsays[
      Schmeicheln Sie mir nicht mit einer Gewalt, von der ich hier keinen Gebrauch absehe. --- Heute, sagen Sie? schon heute?
    ]
    #marinellisays[
      Erst heute --- soll es geschehen. Und nur geschehenen Dingen ist nicht zu raten. #inline-regie[Nach einer kurzen Überlegung.] Wollen Sie mir freie Hand lassen, Prinz? Wollen Sie alles genehmigen, was ich tue?
    ]
    #prinzsays[
      Alles, Marinelli, alles, was diesen Streich abwenden kann.
    ]
    #marinellisays[
      So lassen Sie uns keine Zeit verlieren. --- Aber bleiben Sie nicht in der Stadt. Fahren Sie sogleich nach Ihrem Lustschlosse, nach Dosalo. Der Weg nach Sabionetta geht da vorbei. Wenn es mir nicht gelingt, den Grafen augenblicklich zu entfernen: so denk ich --- Doch, doch; ich glaube, er geht in diese Falle gewiß. Sie wollen, Prinz, wegen Ihrer Vermählung einen Gesandten nach Massa schicken? Lassen Sie den Grafen dieser Gesandte sein; mit dem Bedinge, daß er noch heute abreiset. --- Verstehen Sie?
    ]
    #prinzsays[
      Vortrefflich! --- Bringen Sie ihn zu mir heraus. Gehen Sie, eilen Sie. Ich werfe mich sogleich in den Wagen. #inline-regie[Marinelli geht ab.]
    ]
  ]
  #scene("Siebenter Auftritt")[
    #scene-characters(prinz)
    #prinzsays(instructio: "(Sich nach dem Porträte umsehend)")[
      --- Sogleich! sogleich! --- Wo blieb es? --- Auf der Erde? das war zu arg! #inline-regie[Indem er es aufhebt.] Doch betrachten? betrachten mag ich dich fürs erste nicht mehr. --- Warum sollt' ich mir den Pfeil noch tiefer in die Wunde drücken? #inline-regie[Setzt es beiseite.] --- Geschmachtet, geseufzet hab ich lange genug --- länger als ich gesollt hätte: aber nichts getan! und über die zärtliche Untätigkeit bei einem Haar alles verloren! --- Und wenn nun doch alles verloren wäre? Wenn Marinelli nichts ausrichtete? --- Warum will ich mich auch auf ihn allein verlassen? Es fällt mir ein --- um diese Stunde #inline-regie[nach der Uhr sehend], um diese nämliche Stunde pflegt das fromme Mädchen alle Morgen bei den Dominikanern die Messe zu hören. --- Wie, wenn ich sie da zu sprechen suchte? --- Doch heute, heut an ihrem Hochzeittage --- heute werden ihr andere Dinge am Herzen liegen als die Messe. --- Indes, wer weiß? --- Es ist ein Gang. --- #inline-regie[Er klingelt, und indem er einige von den Papieren auf dem Tische hastig zusammenrafft, tritt der Kammerdiener herein.] Laßt vorfahren! --- Ist noch keiner von den Räten da?
    ]
    #kammerdienersays[
      Camillo Rota.
    ]
    #prinzsays[
      Er soll hereinkommen. #inline-regie[Der Kammerdiener geht ab.] Nur aufhalten muß er mich nicht wollen. Dasmal nicht! --- Ich stehe gern seinen Bedenklichkeiten ein andermal um so viel länger zu Diensten. --- Da war ja noch die Bittschrift einer Emilia Bruneschi. --- #inline-regie[Sie suchend.] Die ist's. --- Aber, gute Bruneschi, wo deine Vorsprecherin...
    ]
  ]
  #scene("Achter Auftritt")[
    #scene-characters((camillo, prinz))
    #prinzsays[
      Kommen Sie, Rota, kommen Sie. --- Hier ist, was ich diesen Morgen erbrochen. Nicht viel Tröstliches! --- Sie werden von selbst sehen, was darauf zu verfügen. --- Nehmen Sie nur.
    ]
    #camillosays[
      Gut, gnädiger Herr.
    ]
    #prinzsays[
      Noch ist hier eine Bittschrift einer Emilia Galot... Bruneschi will ich sagen. --- Ich habe meine Bewilligung zwar schon beigeschrieben. Aber doch --- die Sache ist keine Kleinigkeit. --- Lassen Sie die Ausfertigung noch anstehen. --- Oder auch nicht anstehen: wie Sie wollen.
    ]
    #camillosays[
      Nicht wie ich will, gnädiger Herr.
    ]
    #prinzsays[
      Was ist sonst? Etwas zu unterschreiben?
    ]
    #camillosays[
      Ein Todesurteil wäre zu unterschreiben.
    ]
    #prinzsays[
      Recht gern. --- Nur her! geschwind.
    ]
    #camillosays(instructio: "(stutzig und den Prinzen starr ansehend)")[
      Ein Todesurteil --- sagt' ich.
    ]
    #prinzsays[
      Ich höre ja wohl. --- Es könnte schon geschehen sein. Ich bin eilig.
    ]
    #camillosays[
      #inline-regie[seine Schriften nachsehend] Nun hab ich es doch wohl nicht mitgenommen! --- Verzeihen Sie, gnädiger Herr. --- Es kann Anstand damit haben bis morgen.
    ]
    #prinzsays[
      Auch das! --- Packen Sie nur zusammen; ich muß fort --- Morgen, Rota, ein Mehres! #inline-regie[Geht ab.]
    ]
    #camillosays(instructio: "(den Kopf schüttelnd, indem er die Papiere zu sich nimmt und abgeht)")[
      Recht gern? --- Ein Todesurteil recht gern? --- Ich hätt' es ihn in diesem Augenblicke nicht mögen unterschreiben lassen, und wenn es den Mörder meines einzigen Sohnes betroffen hätte. --- Recht gern! Recht gern! --- Es geht mir durch die Seele dieses gräßliche Recht gern!
    ]
  ]
]
