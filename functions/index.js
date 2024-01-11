const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.checkVegetarianStatus = functions.firestore
    .document('Article/{articleId}')
    .onWrite((change, context) => {
        const document = change.after.exists ? change.after.data() : null;

        // Continuer uniquement si le document existe et est une Pizza
        if (document && document.type === 'Pizza') {
            // Vérifier que 'liste_ingredient' est défini et est un tableau
            if (Array.isArray(document.liste_ingredient)) {
                const ingredients = document.liste_ingredient;
                // Vérifiez que chaque ingrédient est végétarien
                const isVegetarian = ingredients.every(ing => ing.vegetarien === true);

                // Mettre à jour le document avec le statut végétarien
                return change.after.ref.update({ vegi: isVegetarian });
            } else {
                // Si 'liste_ingredient' n'est pas un tableau, enregistrez une erreur dans les logs
                console.log("liste_ingredient is not an array or is not defined");
                return null;
            }
        } else {
            // Si ce n'est pas une Pizza ou si le document n'existe pas, ne faites rien
            return null;
        }
    });




