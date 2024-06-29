import { program } from "commander";

program
.argument('command')
.option('-m <month>', 'month', new Date().getMonth() + 1)
.parse(process.argv);

const options = program.opts();
const command = program.args[0];
const month = parseInt(options.m, 10);
if (month < 1 || month > 12) {
  console.error('不正な月です');
  process.exit(1);
}

const today = new Date();
const selected_month = month;
const calender_year_date = `${selected_month}月 ${today.getFullYear()}`;
const dayArr = ["日","月","火","水","木","金","土"];
const a = new Date(today.getFullYear(), selected_month - 1, 1);
const b = new Date(today.getFullYear(), selected_month, 0);
const firstDate = a.getDate();
const lastDate = b.getDate();
const firstDateDay = a.getDay();

let i = firstDate;
let result = '';
let j = 0;
while (j < firstDateDay) {
    result += '   ';
    j++;
}

while (i <= lastDate) {
    let formattedDay = i < 10 ? ' ' + i : i.toString();
    result += formattedDay + ' ';
    if ((i + firstDateDay) % 7 === 0) {
        result += '\n';
    }
    i++;
}

console.log(`      ${calender_year_date}\n${dayArr.join(' ')}\n${result}`);
