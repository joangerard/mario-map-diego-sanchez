patches-own [madurez agua plaguicida probabilidad_muerte] ;; sera necesario?

to setup
  dinamicas_setup
  setup-patches
  setup-turtles
  paint-hectareas

end

;; ----- SETUP ---------
to dinamicas_setup
    ca
  system-dynamics-setup
end

to setup-patches
  ask patches [ set pcolor brown - 2 ]

end

to setup-turtles
  create-turtles 2;;number    ;; uses the value of the number slider to create turtles
  ask turtle 0
  [
    setxy 14 -14
    set color 75
    set heading -90
  ]
  ask turtle 1
  [
    setxy random-xcor random-ycor
    set color 15
  ]
end

to paint-hectareas  ;; 16 * 16 = 256 patches           256 / 5 hectareas  =  51.2 patches por hectarea    51,2 - 32 patches que bordean el hectarea = 19.2 patches por hectarea  19.2 / 2 = 9,6 patches a lo largo   y 9,6 patches a lo alto
  let x [ pxcor ] of patches
  let y [ pycor ] of patches
  set x -16
  set y 16
  while[y > -14];; y > limite final y
  [
    while [x < 14];; x < limite final x
    [
      ask patch x y [ set pcolor yellow + 4 ]
      set x x + 1
    ]
    set x -16
    set y y - 1
   ;;CONTROLADORES PARA LOS BORDES DE HECTAREA Y LIMITES FINALES.    tope controla el limite en los ejes x e y   para x es el final del modelo,  para y es la posicion y superior que toma una fila de hectareas
   ;;CALCULAR la altura_hectarea y el limite_hectarea  (CREO QUE SON LO MISMO?)
    ;;if [ x = limite_hectarea and y = limite_hectarea ]
    ;;[
      ;;set x = (x + 1)
      ;;set y = tope_y
    ;;]
    ;;if [x = tope_x and y = limite_hectarea ]
    ;;[
      ;;set tope_y (altura_hectarea + 1)
      ;;set x -16
      ;;set y tope_y
    ;;]
  ]

end



;;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

to go
  if ticks = 987
  [
    stop
  ]
  detener-dia
  dinamicas_go
  mover-regadores
  regar-cultivo
  mover-plagas
  plagas-atacar
  ;;aplicar_quimicos

end

;; ----- GO ----------
to dinamicas_go
  system-dynamics-go
  system-dynamics-do-plot
end

;;to es-maiz
;;  ask turtles
 ;; [
  ;;  pcolor = 41 or pcolor = 42 or pcolor = 43 or pcolor = 44 or pcolor = 45 or pcolor = 46 or pcolor = 47  or pcolor = 48 or pcolor = 49
 ;; ]
;;end

to mover-regadores
  ask turtle 0 [
    ;right 1
    if xcor = 14
    [
      set ycor ycor + 1
    ]
    forward 1
  ]
end

to regar-cultivo
  ask turtle 0
  [
    if pcolor = 41 or pcolor = 42 or pcolor = 43 or pcolor = 44 or pcolor = 45 or pcolor = 46 or pcolor = 47  or pcolor = 48 or pcolor = 49
    [
     set pcolor blue + 3
     set agua (agua_por_planta_actual)
    ]
    if agua < G
    [
      set probabilidad_muerte (probabilidad_muerte + 10)
    ]
    ifelse show-agua?
      [ set label agua]
      [ set label "" ]
  ]
end

to mover-plagas
  ask turtle 1
  [
    if pcolor != red
    [
    right random 360
    forward 1
    ]
  ]
end

to plagas-atacar
  ask turtle 1
  [
    if pcolor = 41 or pcolor = 42 or pcolor = 43 or pcolor = 44 or pcolor = 45 or pcolor = 46 or pcolor = 47  or pcolor = 48 or pcolor = 49
    [
     set pcolor red + 3
    ]
  ]
end
;;IDEAS
to generar_campo
end

to sembrar
end

to cuidados_de_maiz
end

to cosechar
end

to aplicar_quimicos
  ask turtle 2
  [
    if plaguicida < Cantidad_de_quimico
    [
      set probabilidad_muerte (probabilidad_muerte + 10)
    ]
  ]
end

to mazorcas_muertas
  ask patches
  [
    let ran random-normal 0 100
    if ran <= probabilidad_muerte and ran > 0
    [
      set pcolor black
    ]
  ]
end

to detener-dia
  ask turtle 0
  [
    if ticks = 987
    [
      stop
    ]
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
716
11
1248
544
-1
-1
15.9
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
26
10
161
43
Inicializar variables
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
192
12
289
45
Correr Flujo
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
418
269
520
314
Plantas regadas
count patches with [pcolor = blue + 3]
2
1
11

SWITCH
471
13
653
46
show-agua?
show-agua?
1
1
-1000

SLIDER
25
57
243
90
agua_por_planta_actual
agua_por_planta_actual
0
100
42.0
0
1
Litros
HORIZONTAL

SLIDER
11
443
184
476
insecticida_por_planta
insecticida_por_planta
0
100
18.0
1
1
NIL
HORIZONTAL

SLIDER
12
284
184
317
Cantidad_semilla
Cantidad_semilla
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
12
359
184
392
Calidad_semilla
Calidad_semilla
0
100
47.0
1
1
NIL
HORIZONTAL

MONITOR
270
52
412
97
Agua por planta optimo
G
2
1
11

MONITOR
529
270
696
315
Volumen de agua por planta
G
2
1
11

BUTTON
292
12
446
45
Correr flujo constante
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
348
628
589
830
Volumen de agua por planta
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"G" 1.0 0 -955883 true "" ""

PLOT
41
714
313
834
Rendimiento
NIL
NIL
0.0
100.0
0.0
100.0
true
false
"" ""
PENS
"" 1.0 0 -16777216 true "" ""

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
1.0
    org.nlogo.sdm.gui.AggregateDrawing 64
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 353 84 60 40
            org.nlogo.sdm.gui.WrappedStock "Densidad_de_siembra" "Calidad_de_semilla / Cantidad_de_semilla" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 345 354 60 40
            org.nlogo.sdm.gui.WrappedStock "Rendimiento" "Densidad_de_siembra * Kilos_de_maiz_por_hectarea" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 360 516 60 40
            org.nlogo.sdm.gui.WrappedStock "Cantidad_de_quimicos_N_hectareas" "Cantidad_de_quimico * N_hectareas" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 20 85 30 30
        org.nlogo.sdm.gui.RateConnection 3 50 100 195 101 341 103 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 7
            org.jhotdraw.standard.ChopBoxConnector REF 1
            org.nlogo.sdm.gui.WrappedRate "(plantas_m2 * PMG) / 100" "Cantidad_de_semilla"
                org.nlogo.sdm.gui.WrappedReservoir  REF 2 0
        org.nlogo.sdm.gui.RateConnection 3 425 103 560 102 695 101 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 1
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 694 86 30 30
            org.nlogo.sdm.gui.WrappedRate "PU_ * CL * PG" "Calidad_de_semilla" REF 2
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 16
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 76 328 30 30
        org.nlogo.sdm.gui.RateConnection 3 106 345 219 357 333 369 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 19
            org.jhotdraw.standard.ChopBoxConnector REF 3
            org.nlogo.sdm.gui.WrappedRate "filas_de_granos * granos_por_fila * mazorcas_por_hectarea" "granos_por_hectarea"
                org.nlogo.sdm.gui.WrappedReservoir  REF 4 0
        org.nlogo.sdm.gui.RateConnection 3 417 373 546 370 675 368 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 3
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 674 353 30 30
            org.nlogo.sdm.gui.WrappedRate "granos_por_hectarea / PMG" "Kilos_de_maiz_por_hectarea" REF 4
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 28
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 54 494 30 30
        org.nlogo.sdm.gui.RateConnection 3 84 510 216 521 348 532 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 31
            org.jhotdraw.standard.ChopBoxConnector REF 5
            org.nlogo.sdm.gui.WrappedRate "Ab / Ds" "ab_y_ds"
                org.nlogo.sdm.gui.WrappedReservoir  REF 6 0
        org.nlogo.sdm.gui.RateConnection 3 432 532 570 520 708 508 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 5
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 707 492 30 30
            org.nlogo.sdm.gui.WrappedRate "ab_y_ds * Dosis_total_q" "Cantidad_de_quimico" REF 6
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 40
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 458 132 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.6" "PU_"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 104 135 50 50
            org.nlogo.sdm.gui.WrappedConverter "4" "plantas_m2"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 704 136 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.6" "PG"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 21 354 50 50
            org.nlogo.sdm.gui.WrappedConverter "8" "filas_de_granos"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 151 403 50 50
            org.nlogo.sdm.gui.WrappedConverter "15" "granos_por_fila"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 32 543 50 50
            org.nlogo.sdm.gui.WrappedConverter "50" "Ab"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 100 550 50 50
            org.nlogo.sdm.gui.WrappedConverter "10" "Ds"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 493 275 50 50
            org.nlogo.sdm.gui.WrappedConverter "850" "PMG"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 311 423 50 50
            org.nlogo.sdm.gui.WrappedConverter "10" "mazorcas_por_hectarea"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 602 138 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.6" "CL"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 344 593 50 50
            org.nlogo.sdm.gui.WrappedConverter "1" "N_hectareas"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 552 591 50 50
            org.nlogo.sdm.gui.WrappedConverter "10" "Dosis_total_q"
        org.nlogo.sdm.gui.BindingConnection 2 142 148 195 101 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 45
            org.nlogo.sdm.gui.ChopRateConnector REF 8
        org.nlogo.sdm.gui.BindingConnection 2 497 146 560 102 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 43
            org.nlogo.sdm.gui.ChopRateConnector REF 13
        org.nlogo.sdm.gui.BindingConnection 2 613 151 560 102 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 61
            org.nlogo.sdm.gui.ChopRateConnector REF 13
        org.nlogo.sdm.gui.BindingConnection 2 710 154 560 102 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 47
            org.nlogo.sdm.gui.ChopRateConnector REF 13
        org.nlogo.sdm.gui.BindingConnection 2 68 376 219 357 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 49
            org.nlogo.sdm.gui.ChopRateConnector REF 20
        org.nlogo.sdm.gui.BindingConnection 2 185 412 219 357 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 51
            org.nlogo.sdm.gui.ChopRateConnector REF 20
        org.nlogo.sdm.gui.BindingConnection 2 321 437 219 357 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 59
            org.nlogo.sdm.gui.ChopRateConnector REF 20
        org.nlogo.sdm.gui.BindingConnection 2 525 317 546 370 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 57
            org.nlogo.sdm.gui.ChopRateConnector REF 25
        org.nlogo.sdm.gui.BindingConnection 2 219 357 546 370 NULL NULL 0 0 0
            org.nlogo.sdm.gui.ChopRateConnector REF 20
            org.nlogo.sdm.gui.ChopRateConnector REF 25
        org.nlogo.sdm.gui.BindingConnection 2 216 521 570 520 NULL NULL 0 0 0
            org.nlogo.sdm.gui.ChopRateConnector REF 32
            org.nlogo.sdm.gui.ChopRateConnector REF 37
        org.nlogo.sdm.gui.BindingConnection 2 575 592 570 520 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 65
            org.nlogo.sdm.gui.ChopRateConnector REF 37
        org.nlogo.sdm.gui.BindingConnection 2 140 565 216 521 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 55
            org.nlogo.sdm.gui.ChopRateConnector REF 32
        org.nlogo.sdm.gui.BindingConnection 2 76 562 216 521 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 53
            org.nlogo.sdm.gui.ChopRateConnector REF 32
        org.nlogo.sdm.gui.BindingConnection 2 502 290 195 101 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 57
            org.nlogo.sdm.gui.ChopRateConnector REF 8
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 998 79 60 40
            org.nlogo.sdm.gui.WrappedStock "RR/db" "E_tc / (Eficiencia_de_riego * 100)" 0
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1020 334 60 40
            org.nlogo.sdm.gui.WrappedStock "G" "( RR/db / f ) * Sp * Sl" 0
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1014 499 60 40
            org.nlogo.sdm.gui.WrappedStock "TA" "G / NP * qa" 0
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 834 85 30 30
        org.nlogo.sdm.gui.RateConnection 3 864 100 925 99 986 99 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 115
            org.jhotdraw.standard.ChopBoxConnector REF 109
            org.nlogo.sdm.gui.WrappedRate "1" "E_tc"
                org.nlogo.sdm.gui.WrappedReservoir  REF 110 0
        org.nlogo.sdm.gui.RateConnection 3 1086 518 1154 517 1223 517 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 113
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1222 502 30 30
            org.nlogo.sdm.gui.WrappedRate "Sp / S_e" "Np" REF 114
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 124
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 860 149 50 50
            org.nlogo.sdm.gui.WrappedConverter "Kp * Epan" "Eto"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 803 212 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.85" "Kp"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 898 229 50 50
            org.nlogo.sdm.gui.WrappedConverter "10" "Epan"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 930 404 50 50
            org.nlogo.sdm.gui.WrappedConverter "1.5" "Sl"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 960 571 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.99" "qa"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 874 338 50 50
            org.nlogo.sdm.gui.WrappedConverter "1" "f"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1130 366 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.35" "Sp"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1153 574 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.2" "S_e"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 950 149 50 50
            org.nlogo.sdm.gui.WrappedConverter "1.15" "Kc"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1118 124 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.95" "Eficiencia_de_riego"
        org.nlogo.sdm.gui.BindingConnection 2 839 223 873 187 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 129
            org.jhotdraw.contrib.ChopDiamondConnector REF 127
        org.nlogo.sdm.gui.BindingConnection 2 914 237 893 190 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 131
            org.jhotdraw.contrib.ChopDiamondConnector REF 127
        org.nlogo.sdm.gui.BindingConnection 2 893 157 925 99 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 127
            org.nlogo.sdm.gui.ChopRateConnector REF 116
        org.nlogo.sdm.gui.BindingConnection 2 965 159 925 99 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 143
            org.nlogo.sdm.gui.ChopRateConnector REF 116
        org.nlogo.sdm.gui.BindingConnection 2 1154 415 1154 517 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 139
            org.nlogo.sdm.gui.ChopRateConnector REF 121
        org.nlogo.sdm.gui.BindingConnection 2 1172 579 1154 517 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 141
            org.nlogo.sdm.gui.ChopRateConnector REF 121
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
