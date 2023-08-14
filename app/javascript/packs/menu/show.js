// document.addEventListener('DOMContentLoaded', function() {
//     document.querySelector('#calculate-button').addEventListener('click', function() {
//         const practice_duration = document.querySelector('input[name="practice_duration"]').value;
//         const player_count = document.querySelector('input[name="player_count"]').value;
//         const court_count = document.querySelector('input[name="court_count"]').value;
//         const set_count = document.querySelector('input[name="set_count"]').value;

//         const result = practice_duration / player_count / court_count / set_count;
//         const playerPerCourt = Math.floor(player_count / court_count);
//         const extraPlayer = player_count % court_count;
        
//         document.querySelector('#result').textContent = '1回あたりの交代時間は' + result + '分です。' + '1コートあたりの人数は' + playerPerCourt + '人です。' + (extraPlayer > 0 ? extraPlayer + '面は' + (playerPerCourt + 1) + '人です。' : '');
        
//         const courtContainer = document.getElementById('court-container');
//         courtContainer.innerHTML = '';

//         for (let i = 0; i < court_count; i++) {
//             const canvas = document.createElement('canvas');
//             canvas.id = 'canvas-' + i;
//             canvas.className = 'canvas';
//             canvas.width = 400;
//             canvas.height = 200;
//             courtContainer.appendChild(canvas);
            
//             const ctx = canvas.getContext('2d');
        
//             const count = i < extraPlayer ? playerPerCourt + 1 : playerPerCourt;
        
//             const courtWidth = canvas.width;
//             const courtHeight = canvas.height;
        
//             const playersPerRow = Math.ceil(Math.sqrt(count));  // players in a single row or column
//             const cellWidth = courtWidth / playersPerRow;
//             const cellHeight = courtHeight / playersPerRow;
        
//             for (let j = 0; j < count; j++) {
//                 const x = (j % playersPerRow + 0.5) * cellWidth;
//                 const y = (Math.floor(j / playersPerRow) + 0.5) * cellHeight;
        
//                 ctx.font = '20px serif';
//                 ctx.fillText(`①${j + 1}`, x, y);
//             }
//         }
//     });
// });
