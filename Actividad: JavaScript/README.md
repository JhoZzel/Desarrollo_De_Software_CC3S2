# Actividad: Java Script
- Chavez Chico Joel Jhotan 20210058J

## Booleano
```js
console.log(undefined == null);
console.log(NaN == NaN);
console.log(null == false);
console.log(0 == false);
console.log("" == false);
```
![](img/1.png)

1. `undefined == null` => `true`: Ambas son consideradas como valor nulo.

2. `NaN == NaN` => `false`: `NaN` (*Not a number*) nunca es igual a otro ‘NaN’ en JavaScript.
3. `null == false` => `false`: `null` no es igual a ‘false’ en JavaScript
4. `0 == false` => `true`: Ambos son considerados iguales ya que JavaScript al comparar valores numéricos con booleanos este evalúa como verdaderos a todos aquellos enteros distintos como `true` dejando únicamente al `0` como `false`.
5. `“ ” == false` => `true`: Similar al caso anterior JavaScript convierte `false` a `0` y la compara con la cadena vacía que se convierte a `0` como número.


## Array
```js
v1 = [1,2,3] + [4,5,6]
console.log(v1)

v2 = !![]
console.log(v2)
console.log([] == true)

v3 = [10,1,3].sort()
console.log(v3)
console.log([] == 0)
```

![](img/2.png)


1. `[1, 2, 3] + [4, 5, 6]`: Esto no produce la concatenación esperada de arrays. En
JavaScript, al sumar dos arrays con el operador ‘+’, se convierten a cadenas y se
concatenan, dando como resultado ‘”1, 2, 34, 5, 6”’
2. ‘!![]’: Se convierte a ‘true’. Un array en JavaScript, aunque esté vacío, es un objeto y, por
lo tanto, se evalúa como verdadero en un contexto booleano.
3. ‘[] == true’: FALSO. Aunque ‘[]’ se evalúa como verdadero, no es igual a ‘true’ en una
comparación de igualdad no estricta (‘==’)
4. ‘[10, 1, 3].sort()’: Ordena el array en orden lexicográfico (alfabético) por defecto, lo que
resultaría en ‘[1, 10, 3]’.
5. ‘[] == 0’: VERDADERO. En una comparación no estricta, JavaScript intenta convertir
ambos lados a un tipo común y en este caso ‘[]’ se convierte a ‘0’ durante la
comparación.


