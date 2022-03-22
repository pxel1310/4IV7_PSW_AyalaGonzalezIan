//vamos a necesitar obtener todas la piezas
var piezas = document.getElementsByClassName('movil');

//redimensionar las piezas
var tamWidh = [134,192,134,163,134,163,134,192,134];
var tamHeight = [163,134,163,134,192,134,163,134,163];

for(var i=0;i<piezas.length;i++){

    //enviar el atributo del w y h
    piezas[i].setAttribute("width", tamWidh[i]);
    piezas[i].setAttribute("height",tamHeight[i]);
    piezas[i].setAttribute("x", Math.floor((Math.random() * 10) + 1));
    piezas[i].setAttribute("y", Math.floor((Math.random() * 409) + 1));

    //Que se pueda mover
    piezas[i].setAttribute("onmousedown","seleccionarElemento(evt)");
}

var elementSelect = 0;  
var currentX = 0;
var currentY = 0;
var currentPosx = 0;
var currentPosy = 0;

function seleccionarElemento(evt) {
    elementSelect = reordenar(evt);
    currentX = evt.clientX;        
    currentY = evt.clientY;
    currentPosx = parseFloat(elementSelect.getAttribute("x"));     
    currentPosy = parseFloat(elementSelect.getAttribute("y"));

    //ahora si debe existir un movimiento
    elementSelect.setAttribute("onmousemove","moverElemento(evt)");
}

function moverElemento(evt){
    var dx = evt.clientX - currentX;
    var dy = evt.clientY - currentY;
    currentPosx = currentPosx + dx;
    currentPosy = currentPosy + dy;
    elementSelect.setAttribute("x",currentPosx);
    elementSelect.setAttribute("y",currentPosy);
    currentX = evt.clientX;        
    currentY = evt.clientY;
    elementSelect.setAttribute("onmouseout","deseleccionarElemento(evt)");
    elementSelect.setAttribute("onmouseup","deseleccionarElemento(evt)");
    iman();
}

function deseleccionarElemento(evt){
    //validar que haga match
    testing();

    //se debe bloquear la pieza
    if(elementSelect != 0){            
        
        //hay que eliminar los atributos
        elementSelect.removeAttribute("onmousemove");
        elementSelect.removeAttribute("onmouseout");
        elementSelect.removeAttribute("onmouseup");
        elementSelect = 0;
    }
}

var entorno = document.getElementById('entorno');

function reordenar(evt){

    var padre = evt.target.parentNode;
    var clone = padre.cloneNode(true);
    var id = padre.getAttribute("id");

    entorno.removeChild(document.getElementById(id));
    entorno.appendChild(clone);
    return entorno.lastChild.firstChild;
}

var originX = [200,304,466,200,333,437,200,304,466];   
var originY = [100,100,100,233,204,233,337,366,337];

function iman(){
    for(var i=0;i<piezas.length;i++){

        if (Math.abs(currentPosx-originX[i])<15 && Math.abs(currentPosy-originY[i])<15){

            elementSelect.setAttribute("x",originX[i]);
            elementSelect.setAttribute("y",originY[i]);
        }
    }
}
            
var win = document.getElementById("win");

function testing() {
    var bien_ubicada = 0;
    var padres = document.getElementsByClassName('padre');
    for(var i=0;i<piezas.length;i++){

        //primero las posiciones
        var posx = parseFloat(padres[i].firstChild.getAttribute("x"));    
        var posy = parseFloat(padres[i].firstChild.getAttribute("y"));
        ide = padres[i].getAttribute("id");
        if(originX[ide] == posx && originY[ide] == posy){
            bien_ubicada = bien_ubicada + 1;
        }
    }
    if(bien_ubicada == 9){
        win.play();
    }
}