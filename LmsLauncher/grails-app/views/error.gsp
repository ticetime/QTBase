<!DOCTYPE html>
<html>
	<head>
		<title>Erreur</title>
		<meta name="layout" content="eliot-tdbase-pub">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
    <h4 class="alert alert-error">Une erreur s'est produite.
    Nous sommes désolés pour la gêne occasionnée.</h4>
    <ul>
      <li><a href="#" onclick="toggleErrorDetail();">Afficher le détail de l'erreur</a></li>
      <li><g:link action="index" controller="home">Accueil</g:link></li>
    </ul>
    <div id="error_detail" style="display: none">
		<g:renderException exception="${exception}" />
    </div>
    <r:script>
      function toggleErrorDetail() {
        $('#error_detail').css('display','block')
      }
    </r:script>
	</body>
</html>
