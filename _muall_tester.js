const { _mu_num, _mu_arr } = require('./_muall');



console.log('====================================================================================================');
console.log('== _mu_num: ', _mu_num);
console.log('====================================================================================================');


console.log('====================================================================================================');
console.log('');
console.log('');
console.log('');



console.log('====================================================================================================');
console.log('== _mu_arr: ', _mu_arr);
console.log('====================================================================================================');
console.log('{{----------------------------------------------------------------------');
const _arr = '0123456789'.split('');
for (let tl = 20, i = -20; i < tl; i++) {
    let tc = _mu_arr.get_at(_arr, i);
    console.log(i, tc);
}
console.log('}}----------------------------------------------------------------------');




console.log('====================================================================================================');
console.log('');
console.log('');
console.log('');




console.log('====>>');