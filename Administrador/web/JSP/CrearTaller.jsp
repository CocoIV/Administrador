<%-- 
    Document   : CrearTaller
    Created on : 20 jun. 2024, 10:00:02
    Author     : Diego
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Carpeta y Archivo TXT</title>
        <link rel="stylesheet" href="../CSS/CrearTaller.css">
    </head>
    <body>
        <h1>Crear Carpeta y Archivo TXT</h1>
        <form method="post" action="CrearTaller.jsp">
            <label for="folderName">Nombre de la Carpeta:</label>
            <input type="text" id="folderName" name="folderName" required><br><br>
            <label for="fileName">Nombre del Archivo TXT:</label>
            <input type="text" id="fileName" name="fileName" required><br><br>
            <input type="submit" value="Crear">
        </form>

        <%
            String folderName = request.getParameter("folderName");
            String fileName = request.getParameter("fileName");

            if (folderName != null && fileName != null) {
                String basePath = "D:\\SimposioData\\";
                String folderPath = basePath + folderName;
                java.io.File folder = new java.io.File(folderPath);
                if (!folder.exists()) {
                    folder.mkdirs();
                }

                String filePath = folderPath + java.io.File.separator + fileName + ".txt";
                java.io.File file = new java.io.File(filePath);
                if (!file.exists()) {
                    file.createNewFile();
                }

                java.io.FileWriter writer = new java.io.FileWriter(file);
                writer.close();

                out.println("<p>Carpeta y archivo creados exitosamente.</p>");
                out.println("<p>Ruta de la carpeta: " + folderPath + "</p>");
                out.println("<p>Ruta del archivo: " + filePath + "</p>");
            }
        %>
    </body>
</html>