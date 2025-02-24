$(document).ready(function(){
    $("#myTable").DataTable({
        'ajax': {
            'url': "/routes/showInfo.py"
        },
        'columns': [
            { products: 'id'},
            { products: 'brand'},
            { products: 'SKU'},
            { products: 'name'},
            { products: 'category'},
            { products: 'original_price'},
            { products: 'discounted_price'},
            { products: 'stock'},
            { products: 'state'},
            { products: 'location'},
            { products: 'warranty'}
        ]
    });
});