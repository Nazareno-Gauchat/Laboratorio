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

// Verificar si se ha enviado el formulario para devolver una reserva
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['devolver'])) {
    $id_reserva = $_POST['id_reserva'];

    // Obtener la fecha y hora actual
    $fecha_devolucion = date('Y-m-d H:i:s');

    // Actualizar el estado de la reserva a "Devuelto" y agregar la fecha de devolución
    $sql_devolver = "UPDATE reservas SET estado_reserva = 'Devuelto', fecha_devolucion = ? WHERE id_reserva = ?";
    $stmt = $conn->prepare($sql_devolver);

    if ($stmt === false) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    // Bind de los parámetros (fecha de devolución y id_reserva)
    $stmt->bind_param('si', $fecha_devolucion, $id_reserva);

    if ($stmt->execute()) {
        echo "<p>Reserva devuelta correctamente.</p>";
    } else {
        echo "<p>Error al devolver la reserva: " . $stmt->error . "</p>";
    }
    $stmt->close();
}

// Obtener la información de reservas junto con el nombre del docente
$sql = "SELECT reservas.*, docentes.nombre_docente 
        FROM reservas
        JOIN docentes ON reservas.id_docente = docentes.id_docente
        WHERE reservas.estado_reserva != 'Devuelto'"; // Filtrar reservas devueltas
$resultado = $conn->query($sql);

if (!$resultado) {
    die("Error en la consulta: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Reservas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f4f4f4;
        }
        .compus-list {
            white-space: pre-wrap; /* Preserva saltos de línea y espacios */
        }
        .devolver-btn {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .devolver-btn:hover {
            background-color: #218838;
        }
        .back-btn {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .back-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Botón para regresar a la página de reservas -->
        <a href="reservar.php"><button class="back-btn">Volver a Reservas</button></a>
        <a href="historial.php"><button>Historial</button></a>

        <h2>Listado de Reservas</h2>
        
        <?php if ($resultado->num_rows > 0): ?>
            <table>
                <thead>
                    <tr>
                        <th>ID Reserva</th>
                        <th>Nombre Docente</th>
                        <th>Curso</th>
                        <th>Fecha Reserva</th>
                        <th>Estado Reserva</th>
                        <th>Computadoras</th>
                        <th>Fecha Devolución</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $resultado->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['id_reserva']) ?></td>
                            <td><?= htmlspecialchars($row['nombre_docente']) ?></td>
                            <td><?= htmlspecialchars($row['curso']) ?></td>
                            <td><?= htmlspecialchars($row['fecha_reserva']) ?></td>
                            <td><?= htmlspecialchars($row['estado_reserva']) ?></td>
                            <td class="compus-list"><?= nl2br(htmlspecialchars($row['computadoras'])) ?></td>
                            <td><?= $row['fecha_devolucion'] ? htmlspecialchars($row['fecha_devolucion']) : 'No devuelto' ?></td>
                            <td>
                                <?php if ($row['estado_reserva'] != 'Devuelto'): ?>
                                    <!-- Formulario para devolver la reserva -->
                                    <form method="POST" action="">
                                        <input type="hidden" name="id_reserva" value="<?= $row['id_reserva'] ?>">
                                        <button type="submit" name="devolver" class="devolver-btn">Devolver</button>
                                    </form>
                                <?php else: ?>
                                    Devuelto
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No se encontraron reservas.</p>
        <?php endif; ?>

    </div>
</body>
</html>

<?php
$conn->close();
?>
