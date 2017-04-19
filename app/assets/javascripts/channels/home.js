function toggle_div(id) {
    var divs = document.getElementsByTagName('div');
    var id = document.getElementById(id);
    for(var i=0; i<divs.length; i++){
        if(divs[i].className=='mask_element'){ // on cible les divisions dont la class est 'mask_element'
            divs[i].style.display = "none"; // on les masque tous
        }
    }
    id.style.display = "block"; // on affiche le div appelé
}

function fermer(id) {
    document.getElementById(id).style.display = "none"; //Fermeture de la div affiché via un bouton
}
