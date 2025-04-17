# Scripts SOM - Gestió de Grups, Usuaris i Carpetes

Aquest repositori conté scripts per a la gestió automatitzada de grups, usuaris i estructures de directoris en sistemes Linux.

## Contingut

El repositori conté els següents scripts:

### creaGrupsUsuaris.sh

Script per a la creació automatitzada de grups i usuaris al sistema.

- Crea els grups necessaris
- Crea els usuaris i els assigna als grups corresponents
- Estableix les contrasenyes inicials

### creaCarpetes.sh

Script per a la creació i gestió de l'estructura de directoris.

- Crea l'estructura de carpetes requerida
- Assigna els permisos adequats per a cada directori
- Estableix la propietat dels directoris als grups i usuaris corresponents

## Ús

1. Donar permisos d'execució als scripts:

```bash
chmod +x creaGrupsUsuaris.sh
chmod +x creaCarpetes.sh
```

2. Executar els scripts en ordre:

```bash
./creaGrupsUsuaris.sh
./creaCarpetes.sh
```

## Requisits

- Sistema operatiu Linux
- Permisos de superusuari (root)
