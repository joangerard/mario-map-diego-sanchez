# mario-map-diego-sanchez TEST

## 1. Definicion del problem solver agent

### 1.A Formulacion del objetivo

El objetivo consiste en que "Mario" debe llegar a la tuberia mas cercana
Como objetivo en segundo plano debemos hacer que "Mario conozca su entorno.

### 1.B Formulacion del problema

#### 1.B.a Estado inicial

Para los casos de prueba principales, el estado inicial de mario sera:
-- Una casilla del mapa seleccionada por el usuario o un mapa predeterminado
    y puede ser cualquier casilla, siempre que este vacia.

#### 1.B.b Descripcion de las acciones

Acciones:
- Moverse una casilla hacia arriba
- Moverse una casilla hacia abajo
- Moverse una casilla hacia la izquierda
- Moverse una casilla hacia la derecha


#### 1.B.c Modelo de transicion

-- Moverse a un nodo adyacente.- Mario podra moverse hacia cualquier nodo que sea adyacente (no diagonal) y que dicho nodo tenga el menor costo o distancia con respecto a un nodo tuberia. De esta forma mario llegara rapidamente a la tuberia mas proxima.

#### 1.B.d Test Objetivo

"Mario" se preguntara: Estoy en un nodo/casilla con tuberia?

#### 1.B.e Funcion del costo de ruta

El costo de ruta es: 1
Porque como solo se realiza la accion de moverse a otra casilla adyacente (no diagonalmente), cada movimiento se realiza uno a la vez. Entonces el costo de transicionar de un estado a otro es 1.

### 1.C Solucion del problema
La ruta que conecta el estado inicial con el estado objetivo es el camino de casillas vacias, que conectan a mario con la tuberia mas cercana.

Para encontrar esta ruta, se utilizo el algoritmo de busqueda BFS.

## 2. Algoritmo para la solucion

BFS es el algoritmo escogido para solucionar este problema

### 2.A Justificacion de desicion
Porque es completo y siempre encontrara la solucion o pipe.

Es optimo, porque encontrara la solucion con menor costo o el pipe mas cercano al estado inicial.

En cuento a su complejidad de tiempo: es b^d  lo cual no es tan malo a comparacion de las otras opciones
(Dfs, Dls, Iterative deepening), porque aunque Dls sea mejor en tiempo, Dls no es completo ni optimo.

En cuanto al space complexity, se todas las demas opciones son mejores, pero no compensan, porque no son optimas
ni completas.

## 3. Explicacion breve de la logica del Algoritmo

### SETUP

Primero el usuario escoge uno de los mapas predeterminados y escoge en que casilla empezara mario (estado inicial), siempre que sea una casilla vacia.

Luego el usuario podra escoger en que casillas vacias colocar las tuberias que guste.

### EXPLICACION LOGICA DEL ALGORITMO PRINCIPAL (BFS):

Mientras que no se haya encontrado la tuberia mas cercana o se determine un "Fail", el algoritmo hara lo siguiente:

    Verifica si es que se encontro la solucion/tuberia, basandose en el *path* y en el *mario_map*.

    Luego actualiza con el *path* con el path que desencolamos de la cola de movimientos *actions*.

    Luego se obtiene cada posible siguiente path que podamos realizar del array de movimientos *moves*. Cada movimiento se concatena con el ultimo *path* obtenido y esta concatenacion la guardamos en la variable string *posible_path*.

    Luego, para cada *posible_path*, se realiza una validacion para ver que no nos conduzca a un camino indeseado y si es asi se descarta. Caso contrario, se agrega el *posible_path* ya validado en la cola de acciones *actions*.

Cuando se encuentra la tuberia mas cercana:

     Se imprimen los movimientos realizados para llegar hasta dicha tuberia, es decir, el camino *path* que conduce hasta dicha tuberia.

     Finalmente se imprime el mapa y en cada casilla indicada por el *path*, marcando esas casillas con algun caracter distintivo para delinear y diferenciar el camino de solucion, al printearse en consola.

### VARIABLES IMPORTANTES

#### mario_map:
 Es el mapa de mario escogido por el usuario. Es un array de arrays (matriz)

#### moves:
Son las acciones que puede realizar mario. Moverse a la izquierda, derecha, arriba y abajo.
Almacena dichas acciones en un array de strings

#### path:
 Es una variable de tipo "string", que va guardando cada conjunto o set de movimientos expulsados de la cola de acciones.
 Ejemplo: "LURUUR" indica que fue a la izquierda, luego arriba, derecha, arriba, arriba y derecha.


#### actions:
 Es la cola a la que se le va encolando cada posible set de movimientos, siempre que este set de movimientos sea valido. Un set de movimientos es valido cuando dicho set nos conduce hacia una casilla vacia y es invalido, cuando nos conduce a una casilla fuera del mapa o hacia una bloque.

#### posible_path:
 Es lo mismo que el 'path', pero es una variable auxiliar que almacena todos los sets de movimientos posibles, para validarlos e insertarlos en a cola de acciones "actions"

### METODOS

#### pipeFinderBFS():
Es aquel que corre todo el algoritmo principal una vez dadas las entradas necesarias.

#### findEnd():
 Valida si es que ya se encontro una tuberia o no.
 De este metodo depende que finalice la ejecucion del metodo principal de BFS.




