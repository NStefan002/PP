import java.io.File
import java.util.Scanner
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

class Ucesnik(jbmg : String, ime : String, prezime : String, nagradjeni : ArrayBuffer[((String, String, String), String)]) extends Thread {
  override def run(): Unit = {
    nagradjeni.synchronized {
      nagradjeni.wait()
    }

    for ((data, nagrada) <- nagradjeni) {
      if (jbmg == data._1) {
        println(data._2 + " " + data._3 + " (" + data._1 + ") je dobitnik nagrade: \"" + nagrada + "\"")
    }
    }
  }
}

object MatfTravel {
  def main(args: Array[String]): Unit = {
    var brPrvih: Int = 1
    var brDrugih: Int = 3
    var brTrecih: Int = 5

    val podaciTakmicara: ArrayBuffer[(String, String, String)] = new ArrayBuffer[(String, String, String)]()
    val sc: Scanner = new Scanner(new File("ucesnici.info"))
    while (sc.hasNext()) {
      podaciTakmicara.append(new Tuple3(sc.next(), sc.next(), sc.next()))
    }

    val tmpTakmicari: ArrayBuffer[(String, String, String)] = podaciTakmicara.clone()

    val nagradjeni: ArrayBuffer[((String, String, String), String)] = new ArrayBuffer[((String, String, String), String)]()
    val rand = new Random()
    while (brTrecih > 0) {
      val randIdx : Int = rand.nextInt(tmpTakmicari.length)
      nagradjeni.append((tmpTakmicari(randIdx), "Vikend na Tari za tri osobe"))
      tmpTakmicari.remove(randIdx)
      brTrecih -= 1
    }
    while (brDrugih > 0) {
      val randIdx : Int = rand.nextInt(tmpTakmicari.length)
      nagradjeni.append((tmpTakmicari(randIdx), "7 dana na Srebrnom jezeru za dve osobe"))
      tmpTakmicari.remove(randIdx)
      brDrugih -= 1
    }
    while (brPrvih > 0) {
      val randIdx : Int = rand.nextInt(tmpTakmicari.length)
      nagradjeni.append((tmpTakmicari(randIdx), "10 dana na Kopaoniku za dve osobe"))
      tmpTakmicari.remove(randIdx)
      brPrvih -= 1
    }

    val ucesnici: ArrayBuffer[Ucesnik] = new ArrayBuffer[Ucesnik]()
    for ((jmbg, ime, prezime) <- podaciTakmicara) {
      ucesnici.append(new Ucesnik(jmbg, ime, prezime, nagradjeni))
    }

    println(ucesnici.length)
    var i : Int = 0
    for (u <- ucesnici) {
      u.start()
      println("Startovo " + i)
      i += 1
    }
    println("\n\n")

    Thread.sleep(2000)

    nagradjeni.synchronized {
      nagradjeni.notifyAll()
    }

    println(ucesnici.length)
    i = 0
    for (u <- ucesnici) {
      u.join()
      println("Dzojnovo " + i)
      i += 1
    }
  }
}