class Barrio {
  const grupoDeElementos = #{}

  method cantidadElementosBuenos() = grupoDeElementos.count({e => e.esBueno()})
  method cantidadElementosMalos() = grupoDeElementos.count({e => !e.esBueno()})
  
  method esCopado() = self.cantidadElementosBuenos() > self.cantidadElementosMalos()
}

class Elemento {
  method esBueno()
  method recibirAtaque(unaPlaga)
}

class Hogar inherits Elemento {
  var nivelMugre
  const confort

  override method esBueno() = nivelMugre <= confort / 2
  override method recibirAtaque(unaPlaga) {
    nivelMugre += unaPlaga.dañoAlAtacar()
  }
}

class Huerta inherits Elemento {
  var produccionEnKilos
  const nivelDeProduccionEsperado = nivelDeProduccion

  override method esBueno() = produccionEnKilos > nivelDeProduccionEsperado.getNivelEsperado()
  override method recibirAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedad()){
        produccionEnKilos -= (unaPlaga.dañoAlAtacar() * 0.10) + 10
    } else{
        produccionEnKilos -= (unaPlaga.dañoAlAtacar() * 0.10)
    }
  }
}

class Mascota inherits Elemento {
  var nivelSalud

  override method esBueno() = nivelSalud > 250
  override method recibirAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedad()){
        nivelSalud -= unaPlaga.dañoAlAtacar()
    }
  }
}

object nivelDeProduccion {
    var nivelEsperado = 10
    method getNivelEsperado() = nivelEsperado
    method setNivelEsperado(unValor) {
      nivelEsperado = unValor
    }

  
}


