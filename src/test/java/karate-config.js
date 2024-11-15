function fn() {
  var env = karate.env;
 var baseURLReqRes = ''

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }


  if (env == 'dev') {
    baseURLReqRes = 'https://reqres.in'

  } else if (env == 'cert') {

 baseURLReqRes = 'https://reqres.in'
  }

var config = {
    env: env,
    baseURLReqRes : baseURLReqRes,
    myVarName: 'someValue'
  }


  return config;
}