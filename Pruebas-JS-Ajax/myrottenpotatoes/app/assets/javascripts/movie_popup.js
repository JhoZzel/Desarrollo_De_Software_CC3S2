var MoviePopup = {
    // Método de configuración que prepara el entorno para la ventana emergente:
    setup: function() {
        // Agregar un 'div' oculto al final de la página para mostrar la ventana emergente:
        let popupDiv = $('<div id="movieInfo"></div>');
        popupDiv.hide().appendTo($('body'));
        $(document).on('click', '#movies a', MoviePopup.getMovieInfo);
    },

    // Método para obtener la información de la película mediante una solicitud AJAX:
    getMovieInfo: function() {
        $.ajax({
            type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: MoviePopup.showMovieInfo,
            error: function(xhrObj, textStatus, exception) { alert('¡Error!'); }
            // Las funciones 'success' y 'error' recibirán 3 argumentos
        });
        return false;
    },

    // Método para mostrar la información de la película en la ventana emergente:
    showMovieInfo: function(data, requestStatus, xhrObject) {
        // Centrar un flotador con la mitad de ancho y un cuarto de alto de la pantalla
        let oneFourth = Math.ceil($(window).width() / 4);
        $('#movieInfo').
            css({'left': oneFourth, 'width': 2 * oneFourth, 'top': 250}).
            html(data).
            show();
        // Hacer que el enlace 'Cerrar' en el elemento oculto funcione
        $('#closeLink').click(MoviePopup.hideMovieInfo);
        return false;  // Prevenir la acción predeterminada del enlace
    },

    // Método para ocultar la información de la película:
    hideMovieInfo: function() {
        $('#movieInfo').hide();
        return false;
    }
};

// Llamar al método 'setup' cuando el documento esté listo
$(MoviePopup.setup);
