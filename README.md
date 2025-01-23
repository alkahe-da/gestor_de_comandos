# Registro de comandos x ANKHAL

### Objetivo

Con este script quiero ayudar a mejorar la visibilidad, la práticidad y la reciclación de comandos de manera muy facil e interactiva. 
El script es muy simple, pero sin duda que nos será de gran ayuda cuando se nos olvida comandos largos o para tener un registro de comandos
ejecutados que también nos ayudaría en la seguridad de nuestro sistema.

### ¿Como usar?

Primero y esencialmente se debe tener el archivo ".bash_history" en $HOME, de lo contrario el script no funcionará o funcionará de manera
incorrecta, por eso se debe tener este archivo. Si no lo tienes, aquí dejo una guía de como crearlo:

	1. touch ~/.bash_history
	2. export HISTFILE=~/.bash_history (Se recomienda poner esta linea dentro del archivo "~/.bashrc")
	3. Listo!

Ejecutarlo es muy fácil, solo es ejecutar el script "main_.sh" y de manera automática debería salir los últimos comandos ejecutados
y así poder escoger un comando olvidado.

### Recomendaciones

Para temas de automatización se recomienda ejecutar este script desde "~/.bashrc" o con el comando "cron", para tenerlo siempre a la mano
y ejecutarlo de manera automática.


## Con mucho cariño: ANKHAL.
