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

// Obtener solo las reservas devueltas y ajustar la fecha a la zona horaria de Argentina
$sql = "SELECT reservas.*, docentes.nombre_docente, 
        CONVERT_TZ(reservas.fecha_devolucion, '+00:00', '-03:00') AS fecha_devolucion_arg 
        FROM reservas
        JOIN docentes ON reservas.id_docente = docentes.id_docente
        WHERE reservas.estado_reserva = 'Devuelto'"; // Filtrar solo reservas devueltas
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
    <title>Listado de Reservas Devueltas</title>
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
        
        <h2>Listado de Reservas Devueltas</h2>
        
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
                            <td><?= nl2br(htmlspecialchars($row['computadoras'])) ?></td>
                            <td><?= htmlspecialchars($row['fecha_devolucion_arg']) ?></td> <!-- Fecha ajustada -->
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No se encontraron reservas devueltas.</p>
        <?php endif; ?>

    </div>
</body>
</html>

<?php
$conn->close();
?>
