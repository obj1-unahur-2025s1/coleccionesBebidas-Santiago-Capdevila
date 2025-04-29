object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    const ingredientes = []

    method rendimiento(cantidad) {
        return ingredientes.sum({ingrediente => ingrediente.cantidadNutrientes()}) * cantidad
    }

    method agregarIngrediente(unosIngredientes) {
        ingredientes + unosIngredientes
    }
}

object aguaSaborizada {
    var otraBebida = null

    method rendimiento(cantidad) {
        return 1 + otraBebida.rendimiento(cantidad) / 4
    }

    method nuevaBebida(unBebida) {
        otraBebida = unBebida
    }
}

object coctel {
    const bebidas = []
    

    method rendimiento(cantidad) {
        var bebidasRendimiento = 1
        return bebidas.forEach({bebida => bebidasRendimiento = bebidasRendimiento * bebida.rendimiento(cantidad)})
    }

    method agregarBebidas(unasBebidas) {
        bebidas + unasBebidas
    } 
}

object coctelSuave {
    const bebidas = []

    method rendimiento(cantidad) {
        const bebidasFiltros = bebidas.filter({bebida => bebida.rendimiento(cantidad) > 0.5})
        return bebidasFiltros.sum({bebida => bebida.rendimiento(cantidad)})
    }

    method agregarBebidas(unasBebidas) {
        bebidas + unasBebidas
    }
}