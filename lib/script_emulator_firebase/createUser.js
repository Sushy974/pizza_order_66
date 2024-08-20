const admin = require("firebase-admin");


admin.initializeApp({
  credential: admin.credential.applicationDefault(),
});

const auth = admin.auth();

auth.createUser({
  email: "nathan@creaapi.com",
  emailVerified: false,
  password: "secretPassword",
  displayName: "John Doe",
  disabled: false
})
.then((userRecord) => {
  console.log("Successfully created new user:", userRecord.uid);
})
.catch((error) => {
  console.log("Error creating new user:", error);
});
