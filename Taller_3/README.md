# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo.
2. Sombrear su superficie a partir de los colores de sus vértices.
3. Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/nakednous/nub/releases) (versión > = 0.2).

## Integrantes

|       Integrantes           |                 github nick                   |
|-----------------------------|-----------------------------------------------|
| Gonzalo Eduardo Baez Sabogal| [gebaezs](https://github.com/gebaezs)         |
| Jhon Jairo Mueses Quitiaquez| [jjmuesesq](https://github.com/jjmuesesq)     |


## Discusión

Durante el proceso de renderización se hace el uso de coordenadas Baricéntricas para identificar si un punto P se encuentra a la derecha o izquierda de una recta. Por lo anterior se tiene 3 rectas que forman un triángulo y por ende para cada recta se verifica que el punto P se encuentre a la derecha de estas en el caso de cumplirse, lo que significa que el punto está dentro del triángulo y por ello, este se pinta.

Se realiza rasterización del triángulo generado de forma automática con el uso de Liberia nub. También se implementa técnicas de anti-aliasing y el modelo de iluminación shading para interpolar colores de vértices de un triángulo sobre una grilla para transición entre colores.

## Anti-aliasing
Técnicas utilizadas: SSAA SuperSampling Anti-Aliasing

Esta técnica suaviza bordes dentados y pixelados en una escena a renderizar.  Se pretende mejorar la calidad a partir de reducción de espaciado. Implementar la partición del píxel aumenta la calidad de imagen n veces más grande según sea establecido.

## Shading
Efecto en la cual produce interpolación de colores de acuerdo con su posición dentro de un triángulo y su cercanía a los vértices.

## Referencias
* [Supersampling](https://en.wikipedia.org/wiki/Supersampling)