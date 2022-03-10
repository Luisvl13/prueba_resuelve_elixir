# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
PruebaResuelveElixir.Repo.insert!(%PruebaResuelveElixir.Sueldos.Equipo{
  nombre: "Resuelve FC",
  niveles: [
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "A", goles_mes: 5},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "B", goles_mes: 10},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "C", goles_mes: 15},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "Cuauh", goles_mes: 20}
  ]
})

PruebaResuelveElixir.Repo.insert!(%PruebaResuelveElixir.Sueldos.Equipo{
  nombre: "Tuxtla FC",
  niveles: [
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "Bronze", goles_mes: 5},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "Plata", goles_mes: 10},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "Oro", goles_mes: 15},
    %PruebaResuelveElixir.Sueldos.Nivel{nivel: "Especial", goles_mes: 20}
  ]
})
