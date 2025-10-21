# Qt Workspace

Workspace organizado para desarrollo con Qt6.

## Estructura

- **projects/** - Proyectos principales de desarrollo
- **templates/** - Templates base para nuevos proyectos
- **resources/** - Assets compartidos (imágenes, fuentes, etc)
- **scripts/** - Utilidades de build/deploy

## Configuración

Qt instalado en: `~/Qt/6.9.3/gcc_64`

---

## Crear nuevo proyecto

### Opción A: Desde template (línea de comandos)
```bash
# Crear desde template, y seguir las instrucciones
./scripts/new-project.sh MiNuevoProyecto

# Ir al proyecto
cd projects/MiNuevoProyecto
```

### Opción B: Con Qt Creator

1. Abrir Qt Creator
2. **File > New Project...**
3. **Application (Qt) > Qt Widgets Application**
4. **Location:** `~/qt-workspace/projects/`
5. **Name:** MiNuevoProyecto
6. **Build system:** CMake
7. **Finish**

---

## Build y ejecución

### Opción A: Línea de comandos
```bash
# Ir al proyecto
cd projects/mi-proyecto

# Build
mkdir build && cd build
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make

# Ejecutar
./MiProyecto
```

### Opción B: Qt Creator

1. Abrir proyecto: `File > Open File or Project...`
2. Seleccionar `CMakeLists.txt`
3. **Configure Project** (seleccionar Desktop Qt 6.9.3)
4. **Compilar:** `Ctrl+B`
5. **Ejecutar:** `Ctrl+R`

### Opción C: Script automático
```bash
cd projects/mi-proyecto
../../scripts/build.sh
./build/MiProyecto
```

---

## Workflows según herramienta

### Qt Creator

**Ventajas:**
- Todo integrado (build, run, debug)
- UI Designer visual
- Autocompletado específico de Qt
- Debugging de señales/slots

**Flujo típico:**
1. `Ctrl+O` - Abrir CMakeLists.txt
2. Editar código
3. `Ctrl+R` - Compila y ejecuta automáticamente
4. `F5` - Debug con breakpoints

**Atajos clave:**
- `Ctrl+B` - Build
- `Ctrl+R` - Run
- `F5` - Debug
- `F2` - Ir a definición
- `Ctrl+K` - Buscar archivo
- `Ctrl+Shift+R` - Renombrar símbolo

---

### VSCode + Terminal

**Ventajas:**
- Copilot y extensiones
- Personalización total
- Integración con otras herramientas

**Flujo típico:**
1. `code projects/mi-proyecto`
2. Editar código
3. Terminal integrada (`Ctrl+`):
```bash
   cd build && make
   ./MiProyecto
```

---

## Añadir archivos al proyecto

### Opción A: Qt Creator (automático)

1. Botón derecho en carpeta `src/` en el panel de proyecto
2. **Add New... > C++ Class**
3. Completar datos (nombre, base class, etc.)
4. Qt Creator actualiza `CMakeLists.txt` automáticamente ✓

### Opción B: Manual
```bash
# Crear archivos
nano src/Canvas.cpp
nano include/PROJECTNAME/Canvas.h

# Editar CMakeLists.txt
nano src/CMakeLists.txt
```

Añadir a CMakeLists.txt:
```cmake
set(SOURCES
    main.cpp
    Canvas.cpp    # ← NUEVO
)
```

Reconfigurar:
```bash
cd build
cmake ..
make
```

O en Qt Creator: `Build > Run CMake`

---

## Debugging

### Qt Creator (visual)

1. Click en número de línea → **Breakpoint** (punto rojo)
2. `F5` - Iniciar debugging
3. **Controles:**
   - `F10` - Siguiente línea (Step Over)
   - `F11` - Entrar en función (Step Into)
   - `Shift+F11` - Salir de función (Step Out)
   - `F5` - Continuar

**Ventajas:**
- Ver jerarquía de QObjects
- Inspeccionar señales/slots conectadas
- Preview de QImage/QPixmap

### Terminal (GDB)
```bash
cd build
gdb ./MiProyecto

(gdb) break main.cpp:10
(gdb) run
(gdb) next
(gdb) print variable
(gdb) continue
```

---

## Testing

### Ejecutar tests

**Línea de comandos:**
```bash
cd build
ctest --output-on-failure
```

**Qt Creator:**
1. Panel izquierdo: **Tests** (icono de matraz)
2. Click derecho en test > **Run**
3. Ve resultados en panel inferior

---

## Recursos adicionales

- Qt Documentation: https://doc.qt.io/
- Este workspace en: `~/qt-workspace/`
- Templates en: `~/qt-workspace/templates/`
- Scripts en: `~/qt-workspace/scripts/`

# Projects Directory

Esta carpeta contiene todos tus proyectos Qt locales.

**Los proyectos NO se suben a este repositorio** - cada proyecto debe tener su propio repo si es necesario.

## Crear nuevo proyecto

Desde la raíz del workspace:
```bash
./scripts/new-project.sh NombreDelProyecto
```

Esto creará: `projects/NombreDelProyecto/` con la estructura completa.

## Tipos de proyectos

- **Tutoriales** - Proyectos de aprendizaje (ej: `qt-HelloWorld`)
- **Tests** - Proyectos de prueba (ej: `TestProject`)
- **Desarrollo** - Proyectos reales (ej: `qt-GeometryViewer`)

## Gestionar proyectos individuales

Si un proyecto necesita su propio repositorio:
```bash
cd projects/MiProyecto
git init
git remote add origin https://github.com/usuario/mi-proyecto.git
# ... commits y push
```

Cada proyecto es independiente del workspace.