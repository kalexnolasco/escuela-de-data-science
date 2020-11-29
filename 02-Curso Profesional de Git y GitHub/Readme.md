# Comandos
* `git init`: lo usamos para determinar la carpeta en la que vamos a trabajar.
* `git config`: muestra configuraciones de git también podemos usar `–list` para mostrar la configuración por defecto de nuestro git y si añadimos `--show-origin` nos muestra las configuraciones guardadas y su ubicación.
    * `git config --global user.name`: cambia de manera global el nombre del usuario, seguidamente ponemos entre comillas nuestro nombre.
    * `git config --global user.email`: cambia de manera global el email del usuario, seguidamente ponemos entre comillas nuestro nombre.
* `git status`: lo usamos para saber si tenemos un archivo añadido o borrado en nuestro proyecto, para saber en la rama en la que estamos y si tenemos commits.
* `git add`: es para añadir un archivo a nuestra rama seguidamente ponemos entre comillas el nombre de nuestro archivo o poner un punto para añadir todos los archios de nuestra carpeta.
* `git rm`: lo usamos para borrar un archivo que hayamos añadido.
    * `git rm --cached`: Elimina los archivos del staging y del próximo commit pero los mantiene en nuestro disco duro.
    * `git rm --force`: Elimina los archivos del staging y del disco duro. Git siempre guarda todo, por lo que podemos acceder al registro de la existencia de los archivos, de modo que podremos recuperarlos si es necesario (pero debemos usar comandos más avanzados).
* `git commit`: se usa para añadir un commit a nuestra rama, también podemos ponerle un `-m`() seguidamente ponemos entre comillas nuestro ensaje(`git commit -m "MENSAJE..."`).
    * `git commit -am "MESANJE"`: agreagamos y realizamos commit a la vez, sólo funciona si los archivos no son nuevos.
* `git log`: se usa para ver la historia de nuestros archivos, los commits, el usuario que lo cambió, cuando se realizaron los cambios etc. seguidamente ponemos el nombre de nuestro archivo.
    * `git log --stat`: nos muestra los cambios específicos de los archivos(cuántos bytes han cambiado).
* `git show`: nos mustra los cambios que han existido sobre los dos últimos commits de un archivo y es muy útil para detectar cuándo se produjeron cambios.
* `git diff`: la diferencia entre una version y otra especificamente (`git diff commitA commitB`). Se puede obtener el ID de los commits con el comando `git log`.
## Volver al pasados `git reset`
```
Este comando nos ayuda a volver en el tiempo. Pero no como git checkout que nos deja ir, mirar, pasear y volver. Con git reset volvemos al pasado sin la posibilidad de volver al futuro. Borramos la historia y la debemos sobreescribir. No hay vuelta atrás.

Este comando es muy peligroso y debemos usarlo solo en caso de emergencia.
```
* `git checkout (COMIT FILE)`: Volvemos nuestro archivo del commit indicado, sin cambiar nada en el staging.
    * `git checkout master (FILE)`: Volvemos nuestro archivo a la versión que teníamos antes de realizar el primer checkout, sin cambiar nada en el staging.
* `git reset`: nos permite volver a una versión anterior, colocandole el ID del commit al que deseamos volver.
    * `git reset --hard`: volvemos absolutamente al cambio borrando completamente todo los cambios que hayan. Se pierde todo de staging area y working directory.
    * `git reset --soft`: Volvemos al pasado manteniendo lo que se tenga en el 'staging area'(si hemos dado git add, se mantienen alli y no se pierden).
    * `git reset HEAD`: Este es el comando para sacar archivos del área de Staging. No para borrarlos ni nada de eso, solo para que los últimos cambios de estos archivos no se envíen al último commit, a menos que cambiemos de opinión y los incluyamos de nuevo en staging con git add, por supuesto.
## Trabajando con repositorio remoto
* `git clone url_del_servidor_remoto`: Nos permite descargar los archivos de la última versión de la rama principal y todo el historial de cambios en la carpeta .git.
* `git push`: Luego de hacer `git add` y `git commit` debemos ejecutar este comando para mandar los cambios al servidor remoto.
* `git fetch`: Lo usamos para traer actualizaciones del servidor remoto y guardarlas en nuestro repositorio local (en caso de que hayan, por supuesto).
* `git merge`: También usamos el comando git merge con servidores remotos. Lo necesitamos para combinar los últimos cambios del servidor remoto y nuestro directorio de trabajo.
* `git pull`: Básicamente, git fetch y git merge al mismo tiempo.
## Tabajando con ramas
* `git branch RAMA`: crea la rama, para cambiarnos de rama debemos utilizar `git checkout RAMA`.
## MERGE
Un merge es un commit. Se debe hacer checkuot a la rama  a la que se quiere traer los cambios. Si en las dos ramas se hicieron cambios sobre la misma línea, git lanza un error y no deja realizar el merge.
## Repositorio Remoto
* `git remote  add origin <ssh-url>`: Establecer un origin en remoto, sede del repositorio remoto para gestionar nuestro proyecto mediante HTTPS
* `git remote`: Verifica la existencia del origin remoto (`git remote -v` lo muestra).
* `git push origin master`: Fusiona la rama master local con la remota.
* `git pull origin master`: Fusiona la rama master remota con la local.
* `git remote set-url origin <ssh-url>`: Cohpnfigura git para conectar con el repositorio remoto a traves de ssh
## TIP: GIT SUPERLOG
Ejecutar este comando en la terminal y queda guardado en los alias pero de git. con esto se puede ejecutar cada que se escribe git superlog
```bash
git config --global alias.superlog "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
```
## TAGS
* `git tag -a nombre-del-tag id-del-commit`: Crear un nuevo tag y asignarlo a un commit.
* `git tag -d nombre-del-tag`: Borrar un tag en el repositorio local.
* `git tag` o `git show-ref --tags`: Listar los tags de nuestro repositorio local.
* `git push origin --tags`: Publicar un tag en el repositorio remoto.
* `git tag -d nombre-del-tag`: y `git push origin :refs/tags/nombre-del-tag`Borrar un tag del repositorio remoto.