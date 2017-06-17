// // This is called with the results from from FB.getLoginStatus().
//   function statusChangeCallback(response) {
//     console.log('statusChangeCallback');
//     console.log(response);
//     // The response object is returned with a status field that lets the
//     // app know the current login status of the person.
//     // Full docs on the response object can be found in the documentation
//     // for FB.getLoginStatus().
//     if (response.status === 'connected') {
//       // Logged into your app and Facebook.
//       // puts response.authResponse.accessToken as argument in this method
//       testAPI();
//     // } else {
//     //   // The person is not logged into your app or we are unable to tell.
//     //   document.getElementById('status').innerHTML = 'Please log ' +
//     //     'into this app.';
//     }
//   }

//   // This function is called when someone finishes with the Login
//   // Button.  See the onlogin handler attached to it in the sample
//   // code below.
//   function checkLoginState() {
//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//     });
//   }

//   // This is where everything gets started
//   window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '1010310732438919',
//       cookie     : true,  // enable cookies to allow the server to access 
//                           // the session
//       xfbml      : true,  // parse social plugins on this page
//       version    : 'v2.8' // use graph api version 2.8
//     });

//     // Now that we've initialized the JavaScript SDK, we call 
//     // FB.getLoginStatus().  This function gets the state of the
//     // person visiting this page and can return one of three states to
//     // the callback you provide.  They can be:
//     //
//     // 1. Logged into your app ('connected')
//     // 2. Logged into Facebook, but not your app ('not_authorized')
//     // 3. Not logged into Facebook and can't tell if they are logged into
//     //    your app or not.
//     //
//     // These three cases are handled in the callback function.

//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//     });

//   };

//   // Load the SDK asynchronously
  
//   (function(d, s, id) {
//     var js, fjs = d.getElementsByTagName(s)[0];
//     if (d.getElementById(id)) return;
//     js = d.createElement(s); js.id = id;
//     js.src = "//connect.facebook.net/en_US/sdk.js";
//     fjs.parentNode.insertBefore(js, fjs);
//   }(document, 'script', 'facebook-jssdk'));

//   // Here we run a very simple test of the Graph API after login is
//   // successful.  See statusChangeCallback() for when this call is made.
//   // place accessToken as an argument in testAPI
//   function testAPI() {
//     console.log('Welcome!  Fetching your information.... ');
//     // In this callback is where all the data about the user resides
//     // Include this between function and /m below =>  {fields: 'id,age_range,email,name, first_name,last_name,picture, gender'},
//     FB.api('/me', function(response) {
//       console.log(response);
//       console.log('Successful login for: ' + response.name);
//       // var username = document.getElementById('user_name');
//       // var useremail = document.getElementById('user_email');
//       // var pictureurl = document.getElementById('user_picture_url');
//       // var accesstoken = document.getElementById('user_access_token');
//       // var button = document.getElementById('signup-button');

//       // username.value = response.name;
//       // useremail.value = response.email;
//       // pictureurl.value = response.picture.data.url;
//       // accesstoken.value = accessToken;
//       // button.click();

//       document.getElementById('status').innerHTML =
//         'Thanks for logging in, ' +
//         '<img src="' + response.picture.data.url +'" height="40"/> ' + response.name + '!';
//     });
//   }

//   // You need to figure out a way to get info from the front to the back
//   // One way, is to have a form on the page, with hidden fields, that gets submitted
//   // when they log in

//   // manage a session through a user, and log them out.
//   // You'll have a session's controller, a thing called logout, and sessions.delete