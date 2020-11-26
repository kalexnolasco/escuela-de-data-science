# Comandos
* `git init`: lo usamos para determinar la carpeta en la que vamos a trabajar.
* `git config`: muestra configuraciones de git también podemos usar `–list` para mostrar la configuración por defecto de nuestro git y si añadimos `--show-origin` nos muestra las configuraciones guardadas y su ubicación.
    * `git config --global user.name`: cambia de manera global el nombre del usuario, seguidamente ponemos entre comillas nuestro nombre.
    * `git config --global user.email`: cambia de manera global el email del usuario, seguidamente ponemos entre comillas nuestro nombre.
* `git status`: lo usamos para saber si tenemos un archivo añadido o borrado en nuestro proyecto, para saber en la rama en la que estamos y si tenemos commits.
* `git add`: es para añadir un archivo a nuestra rama seguidamente ponemos entre comillas el nombre de nuestro archivo o poner un punto para añadir todos los archios de nuestra carpeta.
* `git rm`: lo usamos para borrar un archivo que hayamos añadido, para eliminarlo por completo de nuestra rama usamos `git rm --cached`.
* `git commit`: se usa para añadir un commit a nuestra rama, también podemos ponerle un `-m`() seguidamente ponemos entre comillas nuestro ensaje(`git commit -m "MENSAJE..."`).
* `git log`: se usa para ver la historia de nuestros archivos, los commits, el usuario que lo cambió, cuando se realizaron los cambios etc. seguidamente ponemos el nombre de nuestro archivo.
* `git show`: nos mustra los cambios que han existido sobre los dos últimos commits de un archivo y es muy útil para detectar cuándo se produjeron cambios.
* `git diff`: la diferencia entre una version y otra especificamente (`git diff commitA commitB`). Se puede obtener el ID de los commits con el comando `git log`.
## Volver al pasados `git reset`
* `git reset`: nos permite volver a una versión anterior, colocandole el ID del commit al que deseamos volver.
    * `git reset --hard`: volvemos absolutamente al cambio borrando completamente todo los cambios que hayan. Se pierde todo de staying area y working directory.
    * `git reset --soft`: Volvemos al pasado manteniendo lo que se tenga en el 'staying area'(si hemos dado git add, se mantienen alli y no se pierden).