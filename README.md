
## Prueba Ingeniería Resuelve
### Problema
---

El sueldo de los jugadores del Resuelve FC se compone de dos partes un sueldo fijo y un bono variable, la suma de estas dos partes es el sueldo de un jugador. El bono variable se compone de dos partes meta de goles individual y meta de goles por equipo cada una tiene un peso de 50%.

Tu programa deberá hacer el cálculo del sueldo de los jugadores del Resuelve FC.

Si quieres saber más de la [Prueba Ingeniería Resuelve](https://github.com/resuelve/prueba-ing-backend) 

[Análisis del problema](https://github.com/Luisvl13/prueba_resuelve/blob/master/public/assets/analisis_problema.pdf) 

### Guía de instalación
---

#### Requisitos del servidor

* [Docker](https://www.docker.com/) plataforma de software que le permite crear, probar e implementar aplicaciones rápidamente.

#### Instalación


### Pruebas
---
Para ejecutar los test del proyecto puede correr:

Para las pruebas 
* `mix test test/prueba_resuelve_elixir/prueba_resuelve_elixir_test.exs`

### Estructura JSON
---
#### Solo jugadores
`/api/sueldos-equipos`
```json
{
   "jugadores" : [  
      {  
         "nombre":"Juan Perez",
         "nivel":"C",
         "goles":10,
         "sueldo":50000,
         "bono":25000,
         "sueldo_completo":null,
         "equipo":"rojo"
      },
      {  
         "nombre":"EL Cuauh",
         "nivel":"Cuauh",
         "goles":30,
         "sueldo":100000,
         "bono":30000,
         "sueldo_completo":null,
         "equipo":"azul"
      },
      {  
         "nombre":"Cosme Fulanito",
         "nivel":"A",
         "goles":7,
         "sueldo":20000,
         "bono":10000,
         "sueldo_completo":null,
         "equipo":"azul"

      },
      {  
         "nombre":"El Rulo",
         "nivel":"B",
         "goles":9,
         "sueldo":30000,
         "bono":15000,
         "sueldo_completo":null,
         "equipo":"rojo"

      }
   ]
}
```

#### Equipos
`/api/sueldos-jugadores`
```json
{
    "equipos": [
        {
            "id": 1,
            "nombre": "Resuelve FC",
            "jugadores": [
                {
                    "nombre": "Juan Perez",
                    "nivel": "C",
                    "goles": 10,
                    "sueldo": 50000,
                    "bono": 25000,
                    "sueldo_completo": null,
                    "equipo": "rojo"
                },
                {
                    "nombre": "EL Cuauh",
                    "nivel": "Cuauh",
                    "goles": 30,
                    "sueldo": 100000,
                    "bono": 30000,
                    "sueldo_completo": null,
                    "equipo": "azul"
                },
                {
                    "nombre": "Cosme Fulanito",
                    "nivel": "A",
                    "goles": 7,
                    "sueldo": 20000,
                    "bono": 10000,
                    "sueldo_completo": null,
                    "equipo": "azul"
                },
                {
                    "nombre": "El Rulo",
                    "nivel": "B",
                    "goles": 9,
                    "sueldo": 30000,
                    "bono": 15000,
                    "sueldo_completo": null,
                    "equipo": "rojo"
                }
            ]
        },
        {
            "id": 2,
            "nombre": "Tuxtla FC",
            "jugadores": [
                {
                    "nombre": "Juan Perez",
                    "nivel": "Bronze",
                    "goles": 6,
                    "sueldo": 50000,
                    "bono": 25000,
                    "sueldo_completo": null,
                    "equipo": "rojo"
                },
                {
                    "nombre": "Pedro",
                    "nivel": "Plata",
                    "goles": 7,
                    "sueldo": 100000,
                    "bono": 30000,
                    "sueldo_completo": null,
                    "equipo": "azul"
                },
                {
                    "nombre": "Martin",
                    "nivel": "Oro",
                    "goles": 16,
                    "sueldo": 20000,
                    "bono": 10000,
                    "sueldo_completo": null,
                    "equipo": "azul"
                },
                {
                    "nombre": "Luis",
                    "nivel": "Especial",
                    "goles": 19,
                    "sueldo": 50000,
                    "bono": 10000,
                    "sueldo_completo": null,
                    "equipo": "rojo"
                }
            ]
        }
    ]
}
```
