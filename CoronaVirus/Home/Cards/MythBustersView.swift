//
//  MythBustersView.swift
//  CoronaVirus
//
//  Created by Milovan on 31.03.2021.
//

import SwiftUI
import SwiftUITrackableScrollView

struct MythBustersView: View {
    @State public var showCardExtended = false
    @State private var scrollViewContentOffset = CGFloat(0)
    @State public var showNavigationView = false
    
    var body: some View {
        NavigationView {
            TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {

                    VStack(spacing: 10){
                        Text("Întrebări frecvente")
                            .offset(y: 80)
                            .offset(x: -30)
                            .font(.system(size: 30, weight: .bold))
                            .zIndex(3)
                        
                        Link(destination: URL(string: "https://cetrebuiesafac.ro/intrebari-frecvente-covid19")!){
                            Text("Pentru mai multe informații consultați: www.cetrebuiesafac.ro")
                                .font(.system(size: 10, weight: .bold))
                                .offset(x: -11)
                                .offset(y: 70)
                                .foregroundColor(Color(#colorLiteral(red: 0.846049726, green: 0.3262045681, blue: 0.4684950709, alpha: 1)))
                        }
                        
                                ForEach(intrebariData){item in
                                    IntrebariView(Intrebare: item)
                            }
                        .offset(y: 400)
                        
                        ForEach(1..<intrebariData.count * 2){ i in
                            Spacer()
                        }
                    }
                }
                .background(Image("intrebariFrecvente4").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //.navigationBarTitle("\(scrollViewContentOffset)", displayMode: .inline)
                .navigationBarTitle(scrollViewContentOffset > 5 ? "Întrebări frecvente" : "", displayMode: scrollViewContentOffset > 5 ? .inline : .large)
            }
        }
    }

struct MythBustersView_Previews: PreviewProvider {
    static var previews: some View {
        MythBustersView()
    }
}

struct IntrebariView : View {
    
    @State public var showCardExtended = false
    var Intrebare : Intrebari
    
    var body: some View{
        
        Button(action: {showCardExtended.toggle()}, label: {
            HStack{
                Text(Intrebare.intrebare)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.leading, 20)
                        .foregroundColor(Color(#colorLiteral(red: 0.846049726, green: 0.3262045681, blue: 0.4684950709, alpha: 1)))
                    
                    Spacer()

                        Image(systemName: showCardExtended ? "chevron.up" : "chevron.down")
                            .font(.system(size: 16, weight: .bold))
                            .padding(.trailing, 20)
                            .foregroundColor(Color(#colorLiteral(red: 0.846049726, green: 0.3262045681, blue: 0.4684950709, alpha: 1)))
                            //.rotationEffect(.degrees(showCardExtended ? 360 : 0))
                            //.animation(.easeInOut)
            }
            .frame(width: 330, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
            )
            
        })
        .opacity(1)
        .zIndex(2)
        .animation(.none)
    
    if self.showCardExtended {
        VStack(alignment: .center){
            Text(Intrebare.raspuns)
                .padding(.top, 40) .padding(.bottom, 10) .padding(.leading, 20) .padding(.trailing, 20)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Color.black)
        }
        .frame(width: 330)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 0.9499409795, green: 0.9430018067, blue: 0.9488285184, alpha: 1))))
                //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
        .offset(y: -40)
    }
    }
}


struct Intrebari : Identifiable{
    var id = UUID()
    var intrebare : String
    var raspuns : String
}

let intrebariData = [
    Intrebari(intrebare: "Ce este noul coronavirus ?", raspuns: "Noul coronavirus care provoacă COVID-19 este o nouă infecție virală din categoria coronavirusurilor, care nu era identificată anterior. Virusul care cauzează infecția cu COVID-19 nu este același cu coronavirusurile care circulă în mod comun în populație (Coronavirusurile comunitare), care cauzează boli ușoare ca răceala. \nUn diagnostic cu coronavirus comunitari (229E, NL63 sau HKU1) nu este același lucru cu un diagnostic cu COVID-19. Pacienții cu COVID-19 vor fi evaluați și tratați diferit decât cei cu coronavirusuri comunitare."),
    Intrebari(intrebare: "De ce este boala numită “Coronavirus Disease 2019”, COVID-19?", raspuns: "Pe data de 11 Februarie 2019, Organizația Mondială a Sănătății a anunțat un nume oficial pentru boala virală care cauzează epidemia de coronavirus nou din 2019, identificat prima dată în orașul Wuhan din China. Noul nume al bolii este “Coronavirus disease 2019 - care se traduce “boală coronavirus 2019”- abreviată COVID-19. În COVID ‘CO’ vine de la corona, ‘VI’ vine de la virus și ‘D’ de la disease (boală). Înainte, boala era numită “noul coronavirus - 2019” sau “2019-nCoV”. \nExistă mai multe tipuri de coronavirusuri umane, inclusiv unele care cauzează în mod curent infecții ușoare ale tractului respirator superior. COVID-19 e o boală nouă, cauzată de un coronavirus nou, care nu a fost descoperit anterior la oameni. Numele a fost selectat folosind Ghidul OMS (Organizația Mondială a Sănătății) de bune practici pentru numirea noilor boli infecțioase umane."),
    Intrebari(intrebare: "De ce ar dori cineva să dea vina pe/ sau să evite anumiți indivizi și anumite grupuri din cauza epidemiei?", raspuns: "Cetățenii din România ar putea fi îngrijorați sau anxioși despre prieteni și rude care locuiesc în, se întorc din, sau vizitează zone afectate puternic de COVID-19. Unii oameni sunt îngrijorați de răspândirea bolii. Frica și anxietatea pot duce la stigmă socială, de exemplu față de persoane din China sau Italia sau față de persoane care au fost în carantină sau izolare. \nStigmatizarea e discriminarea unui grup de oameni, un loc sau o națiune. Stigma e asociată cu o lipsă de cunoștințe despre COVID-19 și felurile în care se răspândește, cu o nevoie de a găsi pe cineva vinovat, cu frica de îmbolnăvire și moarte sau cu știri false care împrăștie mituri și zvonuri. \nStigma afectează pe toată lumea deoarece creează mai multă frică sau furie față de oameni obișnuiți care ajung să fie învinuiți în locul bolii care cauzează problema."),
    Intrebari(intrebare: "Cum putem opri stigma asociată COVID-19?", raspuns: "Putem lupta împotriva stigmatizării și să îi ajutăm pe ceilalți, nu să îi rănim, oferind suport social. Trebuie să ne opunem stigmatizării prin stăpânirea bună a datelor exacte. Comunicând strict cunoștințe legate de virus, cum se răspândește și despre efectele acestuia fără a învinovăți categorii largi de persoane pe bază de rasă, etnicitate sau proveniență, putem să oprim stigmatizarea."),
    Intrebari(intrebare: "Ar trebui să fiu îngrijorat(ă) de COVID-19?", raspuns: "Îmbolnăvirile datorită infecției cu noul coronavirus sunt în general ușoare, în special în rândul copiilor și al tinerilor adulți. Cu toate acestea, COVID-19 poate cauza îmbolnăviri serioase: aproximativ 1 din 5 persoane care contactează această boală au nevoie de îngrijiri medicale spitalicești. Este așadar normal ca oamenii să se îngrijoreze de cum îi va afecta epidemia COVID-19 pe ei și pe cei dragi. \nNe concentrăm îngrijorările în acțiuni pentru a ne proteja pe noi, pe cei dragi și comunitatea în care trăim. Prima dintre aceste acțiuni este spălarea frecventă și riguroasă a mâinilor cât și menținerea unei igiene respiratorii bune. În același timp, informați-vă și urmați recomandările autorităților locale și naționale privind orice restricții de călătorie, mobilitate și izolare."),
    Intrebari(intrebare: "Care este sursa virusului?", raspuns: "Coronavirusurile sunt o familie virală numeroasă. Unele pot cauza boli la om pe când altele, precum coronavirusurile canine sau feline infectează doar animalele. Rareori unele coronavirusuri care infectează animalele au făcut tranziția la om, putând fi transmise de către acesta. Asta se suspectează că s-a întâmplat în cazul virusului care cauzează COVID-19. Sindromul Respirator din Orientul Mijlociu (MERS) și Sindromul Respirator Sever Acut (SARS) sunt alte două exemple de coronavirusuri care au trecut de la animal la om."),
    Intrebari(intrebare: "Cum se răspândește virusul?", raspuns: "Virusul a fost detectat pentru prima dată în orașul Wuhan, provincia Hubei, China. Primele infecții au fost conectate, în urma anchetei epidemiologice, de o piață de animale vii. Însă acum virusul se răspândește de la om la om. E important să ținem cont de faptul că răspândirea de la om la om poate continua fără gazde animale. \nUnele virusuri sunt extrem de contagioase (precum pojarul) iar altele mai puțin.Virusul care cauzează COVID-19 pare să fie unul care se răspândește ușor și în mod susținut în comunități (“răspândire comunitară”) în unele zone geografice afectate. Răspândirea comunitară înseamnă că populația dintr-o zona a fost infectată cu virusul, inclusiv un număr de persoane despre care nu se știe unde au contactat boala (nu se cunoaște originea bolii)."),
    Intrebari(intrebare: "Poate cineva care are COVID-19 să răspândească boala?", raspuns: "Virusul care cauzează COVID-19 se răspândește de la om la om. Cineva care este bolnav cu COVID-19 poate răspândi boala către alții. De aceea se recomandă carantinarea pacienților până sunt din nou sănătoși și nu mai prezintă risc de infecție pentru alții. \nSe crede că virusul se răspândește mai ales de la persoană la persoană în mod direct: \n   Între persoane care se află în contact direct (sub 1,5 m) \n   Prin picături respiratorii produse de o persoană infectată care strănută sau care tușește. \nAceste picături microscopice pot ajunge în gura sau nasul persoanelor aflate în apropiere sau pot fi inhalate direct în plămâni."),
    Intrebari(intrebare: "Poate cineva care nu pare bolnav să răspândească virusul?", raspuns: "Se crede că persoanele sunt contagioase mai ales atunci când sunt simptomatice (vizibil bolnave). Este însă posibil ca unele persoane să răspândească virusul înainte sau fără să manifeste simptome; există cazuri în care se pare că acest lucru s-a întâmplat cu noul coronavirus dar aceasta nu pare să fie principala modalitate de răspândire."),
    Intrebari(intrebare: "Pot lua virusul de pe o suprafață sau un obiect contaminat?", raspuns: "Este posibil ca o persoană să se îmbolnăvească de COVID-19 prin atingerea unei suprafețe sau al unui obiect care are virusul pe el, apoi atingându-și gura, nasul sau ochii, dar aceasta nu pare să fie principala modalitate de răspândire."),
    Intrebari(intrebare: "Cât timp poate supraviețui noul coronavirus pe suprafețe contaminate?", raspuns: "Deși încă nu este sigur cât timp supraviețui virusul care cauzează COVID-19 pe suprafețe, Organizația Mondială a Sănătății sugerează că acesta pare să se comporte ca și celălalte tipuri de coronavirus. Studiile făcute pe acestea sugerează că pot persista pe suprafețe între câteva ore și câteva zile (informație susținută și de datele preliminare despre noul coronavirus). Acest timp poate varia în funcție de condiții (ex. tipul de suprafață, temperatura sau umiditatea din mediu). \nDacă considerați că o suprafață ar putea fi infectată, curățați-o cu un dezinfectant pentru a omorâ virusul și pentru a vă proteja pe dumneavoastră și pe cei din jur. Curățați-vă apoi mainile cu o soluție pe bază de alcool sau spălați-vă pe mâini cu apă și săpun. Evitați să vă atingeți ochii, nasul și gura."),
    Intrebari(intrebare: "Care este durata de infecție cu COVID-19?", raspuns: "Cât de multă vreme o persoană e bolnavă în mod activ variază de la om la om și la fel poate varia decizia de a elibera pe cineva din spital, carantină sau izolare. Eliberarea se face de la caz la caz în funcție de decizia personalului medical și al specialiștilor în prevenția răspândirii bolilor infecțioase. Decizia se ia pe baza simptomatologiei și testelor de laborator. \nDirectivele Centrului de Control și Prevenția al Bolilor (CDC) din SUA subliniază trei criterii pentru eliberarea din carantină: \n   Pacientul nu are febră (fără a fi folosit medicamente ce reduc febra) \n   Pacientul nu are tuse sau alte simptome fizice \n   Pacientul a ieșit negativ la cel puțin două teste de exudat faringian consecutive, luate la distanță de 24 de ore. \n   O persoană eliberată din izolare e considerată ca fiind necontagioasă, neprezentând risc de infecție pentru alții."),
    Intrebari(intrebare: "Poate o persoană care a fost în carantină să îi infecteze pe alții?", raspuns: "Carantină înseamnă separarea unei persoane sau a unui grup de persoane care a fost expus unei boli contagioase (dar nu a dezvoltat simptome de boală) de populația care nu a fost expusă, pentru a limita posibilitățile de răspândire ale bolii. La fel ca autoizolarea, carantina este de obicei stabilită pentru perioada de incubație a bolii comunicabile, adică durata de timp în care oamenii dezvoltă boala după expunere. Pentru COVID-19, perioada de carantinare e de 14 zile de la data expunerii, deoarece 14 zile este cea mai lungă perioadă de incubație descoperită la coronavirusuri similare. O persoană eliberată din carantină e considerată ca fiind necontagioasă, neprezentând risc de infecție pentru alții."),
    Intrebari(intrebare: "Poate virusul care cauzează COVID-19 să fie răspândit prin mâncare, inclusiv mâncare congelată sau refrigerată?", raspuns: "De regulă coronavirusurile se răspândesc de la persoană la persoană prin picături respiratorii. În prezent nu există dovezi care să susțină transmisia CIVID-19 prin mâncare. Înainte de a pregăti mâncare sau de a mânca e important să vă spălați pe mâini cu apă și săpun timp de 20 de secunde pentru siguranța alimentară generală. Pe toată durata zilei spălați-vă pe mâini de fiecare dată când tușiți strănutați, vă suflați nasul sau mergeți la toaletă. \nAr putea fi posibil ca o persoană să se îmbolnăvească de COVID-19 prin atingerea unei suprafețe sau a unui obiect care are virusul pe el, apoi atingându-și gura, nasul sau chiar ochii, dar aceasta nu pare să fie principala modalitate de răspândire. \nÎn general, deoarece coronavirusurile supraviețuiesc puțin timp pe suprafețe, riscul de îmbolnăvire de la ambalaje sau produse alimentare e foarte scăzut, acestea călătorind timp de zile sau chiar săptămâni la temperaturi ambientale, refrigerate sau congelate."),
    Intrebari(intrebare: "Va opri vremea caldă epidemia de COVID-19?", raspuns: "Nu se știe încă sigur dacă vremea și temperatura influențează răspândirea COVID-19. Alte virusuri, precum răceala sau gripa se răspândesc mai mult când vremea e rece dar asta nu înseamnă că e imposibil să te îmbolnăvești cu aceste virusuri în lunile calde. În acest moment nu știm dacă răspândirea COVID-19 va scădea când vremea se va încălzi."),
    Intrebari(intrebare: "Ce e răspândirea comunitară? ", raspuns: "Răspândirea comunitară e când mai multe persoane au fost infectate într-o zonă, inclusiv unele persoane care nu sunt sigure de metoda prin care au fost infectate (nu se cunoaște sursa infectării).")
]
