$(document).ready(function () { // Decimos que cuando el documento este listo (Cuando se abra el HTML), crearemos una constante que sera la tabla y llamara a la funcion que creamos
    const table = initializeDataTable();
});

function initializeDataTable() { //Funcion para crear la tabla dandole parametros
    return $("#devicesTable").DataTable({ // Con el ID de la tabla que queremos, usamos la funcion Datatable() y le damos parametros
            ajax: { // AJAX es para que haga funciones Asyncronas (Que no detiene el funcionamiento de el codigo mientras se ejecuta)
                    // Y al terminar recarga la Datatable sin necesidad de recargar la Pagina completa

                url: "http://127.0.0.1:4000/get_products", // Le damos la URL para hacer algo parecido a un fetch()
                                                           // La URL es la que usamos para ir a la ruta /get_products cuando esta iniciada la app
                                                           // Debe retornar un JSON y nada mas

                method: "GET", //Le especificamos el metodo, en este caso un GET por que queremos la informacion

                dataSrc: "" // Indica de donde viene la informacion, como en este caso mandamos directamente la informacion de cada producto, se deja vacio
            },
            columns: [ // Le indicamos como llenara las columnas, las columnas deben coincidir en cantidad con las que pusimos como Head de la tabla (Si pusimo 11 Head deben haber 11 columnas)
                       // Con la estructura { data: key }, el "data" siempre se pone igual, la "key" es la key de la info del JSON que queremos mostrar en esa columna
                       // Por ejemplo si en el JSON tenemos {'edad': 19, 'nombre': 'Josue'} y queremos pintar 'Josue' en una columna
                       // Para llamar 'Josue' pondriamos { data: nombre }
                { data: 'id'},
                { data: 'SKU'},
                { data: 'brand'},
                { data: 'name'},
                { data: 'category'},
                { data: 'original_price'},
                { data: 'discount_price'},
                { data: 'stock'},
                { data: 'state'},
                { data: 'location'},
                { data: 'warranty'}
            ],
            responsive: true // Esto activa el responsive en las Datatables
        });
};
