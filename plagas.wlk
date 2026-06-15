class Plaga {
  var poblacion

  method dañoAlAtacar()
  method transmiteEnfermedad() = poblacion >= 10
  method atacarAElemento(unElemento) {
    poblacion = poblacion * 1.1
    unElemento.recibirAtaque(self)
  }
}

class Cucaracha inherits Plaga {
  var pesoPromedioDeCadaUna

  override method dañoAlAtacar() = poblacion / 2
  override method transmiteEnfermedad() = super() and pesoPromedioDeCadaUna >= 10

  override method atacarAElemento(unElemento) {
    pesoPromedioDeCadaUna += 2
    super(unElemento)
  }
}

class Pulga inherits Plaga {
  override method dañoAlAtacar() = poblacion * 2
  
}

class Garrapata inherits Plaga {
  override method dañoAlAtacar() = poblacion * 2
  override method atacarAElemento(unElemento) {
    poblacion = poblacion * 1.2
    unElemento.recibirAtaque(self)
  }
}

class Mosquito inherits Plaga {
  override method dañoAlAtacar() = poblacion
  override method transmiteEnfermedad() = super() and poblacion % 3 == 0
}