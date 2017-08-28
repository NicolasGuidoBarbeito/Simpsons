object region {
	const listaDeCiudades = [albuquerque, springfield]
 method centralesConMasProduccion () {
  return listaDeCiudades.filter({unaCiudad => unaCiudad.centralConMasProduccion()})
 }
}
object albuquerque {
	const listaDeCentrales = [centralHidroelectrica]
	method centralConMasProduccion () {
	return listaDeCentrales.max({unaCentral => unaCentral.produccion()})
	}
}
object centralHidroelectrica {
	const rio = 150
	var produccionTotal
	method produccion(){
		produccionTotal = 2 * rio
	}
}
object springfield {
	const listaDeCentrales = [centralAtomica, centralCarbon, centralEolica]
	const viento = 10
	const riquezaSuelo = 0.9
	var produccionTotalDeCentrales
	var necesidad
	var contaminacionTotalDeCentrales
	method produccionEnergetica (unaCentral){
		return unaCentral.produccion()
	}
	method centralContaminante (unaCentral){
		return unaCentral.contaminacion()
	}
	method produccionDeCentrales () {
		produccionTotalDeCentrales = listaDeCentrales.sum({unaCentral => unaCentral.centralContaminante(unaCentral)})
	}
	method contaminacionDeCentrales () {
		contaminacionTotalDeCentrales = listaDeCentrales.sum({unaCentral => unaCentral.centralContaminante(unaCentral)})
	}
	method necesidad (unaCantidad){
		necesidad = unaCantidad
	}
	method cubrioNecesidades(unaCantidad){
		return unaCantidad < produccionTotalDeCentrales
	}
	method sonTodasCentralesContaminantes(){
		return listaDeCentrales.all {unaCentral => unaCentral.centralContaminante(unaCentral)}
	}
	method centralesAportanMuchaContaminacion (){
		return contaminacionTotalDeCentrales > produccionTotalDeCentrales * 0.5
	}
	method estaEnElHorno(){
		return listaDeCentrales.sonTodasCentralesContaminantes() or listaDeCentrales.centralesAportanMuchaContaminacion()
	}
	method centralConMasProduccion () {
	return listaDeCentrales.max({unaCentral => unaCentral.produccion()})
	}
method centralesContaminantes (){
	return listaDeCentrales.filter({unaCentral => unaCentral.contaminacion()})
}
}


object centralAtomica {
var varillas
var produccionTotal
	method produccion() {
	 produccionTotal = varillas * 0.1
	}
	method contaminacion() {
		return varillas > 20
	}
	method varillas (cantidad) {
		varillas = cantidad
	}
}
object centralCarbon {
	var capacidad = 0
	const riquezaSuelo = 0.9
	var produccionTotal
	method produccion () {
	  produccionTotal = (0.5 * capacidad) + riquezaSuelo
	}
	method contaminacion (){
		return true
	}
	method capacidad (cantidad){
		capacidad = cantidad
	}
}
object centralEolica {
	var turbinas = [turbina]
	var produccionTotal
	method agregarTurbina (unaTurbina){
		turbinas.add(unaTurbina)
	}

	method produccion() {
		produccionTotal = turbinas.sum({unaTurbina => unaTurbina.produccionTurbina()})
	}
	method contaminacion () {
		return false
	}
}
object turbina {
	const viento = 10
	var produccionTurbina
	method produccionDeTurbina() {
	 produccionTurbina = 0.2 * viento
}
}