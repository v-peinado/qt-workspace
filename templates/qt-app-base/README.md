# PROJECTNAME

Brief description of the project.

## Requirements

- Qt 6.9.3+
- CMake 3.16+
- C++17 compiler

---

## Quick Start

### Opción A: Qt Creator (más rápido)

1. Abrir Qt Creator
2. `File > Open File or Project...`
3. Seleccionar este `CMakeLists.txt`
4. `Configure Project` (Desktop Qt 6.9.3)
5. `Ctrl+R` para compilar y ejecutar

### Opción B: Línea de comandos
```bash
mkdir build && cd build
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
./PROJECTNAME
```

---

## Development Workflow

### Con Qt Creator (recomendado)

**Setup inicial:**
1. Abrir `CMakeLists.txt` con Qt Creator
2. Configure Project

**Desarrollo diario:**
1. Editar código en el editor
2. `Ctrl+S` - Guardar
3. `Ctrl+R` - Compila y ejecuta automáticamente

**Añadir nuevos archivos:**
1. Botón derecho en `src/` > **Add New...**
2. Seleccionar tipo (C++ Class, Header, etc.)
3. CMakeLists.txt se actualiza automáticamente

**Debugging:**
1. Click en número de línea para breakpoint
2. `F5` para iniciar debug
3. `F10` / `F11` para navegar

---

### Con Terminal/VSCode

**Build:**
```bash
cd build
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
```

**Rebuild después de cambios:**
```bash
cd build
make
```

**Reconfigurar (si añadiste archivos):**
```bash
cd build
cmake ..
make
```

**Ejecutar:**
```bash
./PROJECTNAME
```

---

## Project Structure
```
PROJECTNAME/
├── CMakeLists.txt           # Build configuration
├── README.md                # This file
├── .gitignore              # Git ignore rules
│
├── include/PROJECTNAME/    # Public headers
│   ├── core/
│   ├── ui/
│   └── utils/
│
├── src/                    # Implementation
│   ├── main.cpp
│   ├── core/
│   ├── ui/
│   └── CMakeLists.txt
│
├── tests/                  # Unit tests
│   └── CMakeLists.txt
│
├── resources/              # Assets
│   ├── images/
│   └── fonts/
│
└── scripts/                # Utility scripts
    └── rename_project.sh
```

---

## Building for Different Configurations

### Debug (default)

**Terminal:**
```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
```

**Qt Creator:**
- Panel izquierdo: Seleccionar **Debug** en el selector de configuración

---

### Release

**Terminal:**
```bash
mkdir build-release && cd build-release
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
```

**Qt Creator:**
1. Panel izquierdo: Click en **Debug** dropdown
2. Seleccionar **Release**
3. `Ctrl+B` para compilar

---

## Common Tasks

### Limpiar build

**Terminal:**
```bash
rm -rf build/*
cd build
cmake ..
make
```

**Qt Creator:**
`Build > Clean All`

---

### Ver warnings de compilación

**Terminal:**
```bash
make VERBOSE=1
```

**Qt Creator:**
Panel inferior > **Compile Output**

---

### Ejecutar con argumentos

**Terminal:**
```bash
./PROJECTNAME --arg1 value
```

**Qt Creator:**
1. `Projects` (panel izquierdo)
2. `Run > Command line arguments`
3. Añadir: `--arg1 value`

---

## Troubleshooting

### "Qt6 not found"

**Solución:**
```bash
export CMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
```

O al configurar:
```bash
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
```

### "Cannot open CMakeLists.txt.user"

**Solución:**
Archivo de configuración de Qt Creator, seguro ignorarlo.
Está en `.gitignore`.

### Build muy lento

**Solución terminal:**
```bash
make -j$(nproc)  # Usa todos los cores
```

**Qt Creator:**
`Tools > Options > Build & Run > CMake > Generator arguments`
Añadir: `-j8` (ajustar número)

---

## Resources

- Qt Documentation: https://doc.qt.io/qt-6/
- CMake Documentation: https://cmake.org/documentation/
- Project workspace: `~/qt-workspace/`