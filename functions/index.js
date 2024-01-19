const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.checkVegetarianStatus = functions.firestore
    .document('Article/{articleId}')
    .onWrite((change, context) => {
        const document = change.after.exists ? change.after.data() : null;


        if (document && document.type === 'Pizza') {

            if (Array.isArray(document.liste_ingredient)) {
                const ingredients = document.liste_ingredient;

                const isVegetarian = ingredients.every(ing => ing.vegetarien === true);


                return change.after.ref.update({ vegi: isVegetarian });
            } else {

                console.log("liste_ingredient is not an array or is not defined");
                return null;
            }
        } else {

            return null;
        }
    });

    function setCustomUserClaims(uid, role) {

      return admin.auth().setCustomUserClaims(uid, { role })
        .then(() => {
          console.log(`Successfully set role to user ${uid}`);
        })
        .catch(error => {
          console.log(`Error setting custom claims: ${error}`);
        });
    }


    setCustomUserClaims('EoGc5gZDKWvrwpKWojfYVSSgNJpc', 'admin');
    setCustomUserClaims('FppvdXAl2IiI84M3XHuHPia5BPdV', 'cook');




