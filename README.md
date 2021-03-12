# mario-map-diego-sanchez TEST

## 1. Definicion del problem solver agent

### 1.A Formulacion del objetivo

El objetivo consiste en que "Mario" debe llegar a la tuberia mas cercana
Como objetivo en segundo plano debemos hacer que "Mario conozca su entorno.

### 1.B Formulacion del problema

#### 1.B.a Estado inicial

Para los casos de prueba principales, el estado inicial de mario sera:
-- La raiz del arbol

#### 1.B.b Descripcion de las acciones

Accion unica: Moverse a cualquier nodo/casilla adyacente

#### 1.B.c Modelo de transicion

-- Moverse a un nodo adyacente.- Mario podra moverse hacia cualquier nodo que sea adyacente (no diagonal) y que dicho nodo tenga el menor costo o distancia con respecto a un nodo tuberia. De esta forma mario llegara rapidamente a la tuberia mas proxima.

#### 1.B.d Test Objetivo

"Mario" se preguntara: Estoy en un nodo con tuberia?

#### 1.B.e Funcion del costo de ruta

El costo de ruta es: 1
Porque como solo se realiza la accion de ir a un nodo adyacente, el costo de transicionar
de un estado a otro es 1.

### 1.C Solucion del problema

## 2. Algoritmo para la solucion

### 2.A Justificacion de desicion

## 3. Explicacion breve de la logica del Algoritmo
