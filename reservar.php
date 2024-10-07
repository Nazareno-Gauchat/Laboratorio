<?php
session_start(); // Inicia la sesión

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestorlabo";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Depurar datos recibidos
    echo '<pre>';
    print_r($_POST);
    echo '</pre>';

    $id_docente = $conn->real_escape_string($_POST['id_docente']);
    $curso = $conn->real_escape_string($_POST['curso']);
    $compus = $conn->real_escape_string($_POST['compus']); // Códigos de las computadoras

    // Convertir los códigos de computadoras a un array
    $compus_array = explode("\n", trim($compus));
    $compus_array = array_map('trim', $compus_array); // Limpiar espacios en blanco
    $compus_array = array_filter($compus_array); // Eliminar elementos vacíos

    // Verificar si hay duplicados en el array
    if (count($compus_array) !== count(array_unique($compus_array))) {
        echo "Error: Se han ingresado códigos de computadoras duplicados.";
        exit;
    }

    // Guardar el docente y curso seleccionados en la sesión
    $_SESSION['docente_seleccionado'] = $id_docente;
    $_SESSION['curso_seleccionado'] = $curso;

    // Insertar la reserva con prepared statement
    $stmt = $conn->prepare("INSERT INTO reservas (id_docente, curso, fecha_reserva, estado_reserva, computadoras) VALUES (?, ?, NOW(), 'activa', ?)");
    $stmt->bind_param("sss", $id_docente, $curso, implode("\n", $compus_array));
    if ($stmt->execute()) {
        echo "Reserva realizada con éxito.<br>";
    } else {
        echo "Error en la inserción de reserva: " . $conn->error;
    }
    $stmt->close();

    // Registrar movimiento
    $stmt = $conn->prepare("INSERT INTO movimientos (id_reserva, fecha_movimiento, tipo_movimiento) VALUES (LAST_INSERT_ID(), NOW(), 'reserva')");
    if ($stmt->execute()) {
        echo "Movimiento registrado con éxito.<br>";
    } else {
        echo "Error al registrar el movimiento: " . $conn->error;
    }
    $stmt->close();
}

// Obtener docentes disponibles
$docentes = $conn->query("SELECT * FROM docentes");

// Obtener el docente y curso seleccionados previamente
$docente_seleccionado = isset($_SESSION['docente_seleccionado']) ? $_SESSION['docente_seleccionado'] : '';
$curso_seleccionado = isset($_SESSION['curso_seleccionado']) ? $_SESSION['curso_seleccionado'] : '';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar Computadora</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }
        select, input[type="text"], textarea {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            margin: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function validarCódigosUnicos() {
            const compus = document.getElementById('compus').value.trim().split('\n').map(c => c.trim());
            const compusUnicas = [...new Set(compus)]; // Elimina duplicados
            if (compus.length !== compusUnicas.length) {
                alert('Error: Existen códigos de computadoras duplicados.');
                return false; // Evita que el formulario se envíe
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="navigation-buttons">
            <a href="devolver.php"><button>Ir a Devoluciones</button></a>
            <a href="historial.php"><button>Historial</button></a>

        </div>
        <h2>Reservar Computadora</h2>

        <form method="post" onsubmit="return validarCódigosUnicos();">
            <label for="docente">Docente:</label>
            <select name="id_docente" id="docente">
                <?php while ($row = $docentes->fetch_assoc()): ?>
                    <option value="<?= htmlspecialchars($row['id_docente']) ?>" <?= htmlspecialchars($row['id_docente']) == $docente_seleccionado ? 'selected' : '' ?>>
                        <?= htmlspecialchars($row['nombre_docente']) ?>
                    </option>
                <?php endwhile; ?>
            </select>

            <label for="curso">Curso:</label>
            <select name="curso" id="curso">
                <option value="1A" <?= $curso_seleccionado == '1A' ? 'selected' : '' ?>>1A</option>
                <option value="1B" <?= $curso_seleccionado == '1B' ? 'selected' : '' ?>>1B</option>
                <!-- Agregar más opciones según sea necesario -->
            </select>

            <label for="compus">Códigos de Computadoras (una por línea):</label>  
            <textarea id="compus" name="compus" rows="5" required placeholder="Ingresa cada código en una nueva línea"></textarea>

            <input type="hidden" id="hora_ingreso" name="hora_ingreso">

            <label for="estado">Estado:</label>
            <select id="estado" name="estado" required>
                <option value="Prestada">Reservar</option>
            </select>

            <label for="observaciones">Observaciones:</label>
            <textarea id="observaciones" name="observaciones" rows="3" placeholder="Escribe tus observaciones aquí"></textarea>

            <button type="submit">Guardar</button>
        </form>
    </div>
</body>
</html>
