document.addEventListener('turbolinks:load', function() {  
    document.querySelector('#calculate-button').addEventListener('click', function() {
        const practice_duration = parseFloat(document.querySelector('input[name="practice_duration"]').value);
        const player_count = parseFloat(document.querySelector('input[name="player_count"]').value);
        const court_count = parseFloat(document.querySelector('input[name="court_count"]').value);
        const set_count = parseFloat(document.querySelector('input[name="set_count"]').value);

        const result = practice_duration / ((player_count / court_count) * set_count);
        const roundedResult = result.toFixed(1);
        const playerPerCourt = Math.floor(player_count / court_count);
        const extraPlayer = player_count % court_count;
        const calculation_court_count = court_count;
        

        document.querySelector('#result').textContent = '1回あたりの交代時間は' + roundedResult + '分です。' + '1コートあたりの人数は' + playerPerCourt + '人です。' + (extraPlayer > 0 ? extraPlayer + '面は' + (playerPerCourt + 1) + '人です。' : '');

        const courtContainer = document.getElementById('court-container');                              //HTML文書内のIDが 'court-container' の要素を取得し、courtContainer という変数に格納
        courtContainer.innerHTML = '';                                                                  //court-container' 要素内のすべてのHTMLコンテンツを削除

        const maxPlayersPerCourt = 8;                                                                   // 1コートあたりの最大人数
        const display_court_count = Math.min(Math.max(court_count, 1), 2);                                            // コート数が2以上なら2とする

        for (let i = 0; i < display_court_count; i++) {
            // 画像の追加
            const courtImage = document.createElement('img');
            const courtImagePath = window.courtImagePath;                        
            courtImage.src = window.courtImagePath;
            courtImage.className = 'court-image';
            courtImage.alt = 'Tennis Court';
            courtImage.width = 395;                                                                     // 画像の幅を設定
            courtImage.height = 700;
            courtContainer.appendChild(courtImage);

            // canvasの追加
            const canvas = document.createElement('canvas');
            canvas.id = 'canvas-' + i;
            canvas.className = 'canvas';
            canvas.width = 395;
            canvas.height = 700;
            courtContainer.appendChild(canvas);
            
            const ctx = canvas.getContext('2d');

            let playersForThisCourt = Math.floor(player_count / court_count);                          //このコートに配置するプレーヤー数を計算します。合計プレーヤー数をコート数で割る
            if (i < player_count % court_count) playersForThisCourt++;                                 //プレーヤー数が均等に分割できない場合、最初のいくつかのコートに追加のプレーヤーを配置

            playersForThisCourt = Math.min(playersForThisCourt, maxPlayersPerCourt);                   //このコートに配置するプレーヤー数が最大値を超えないようにする

            const courtWidth = canvas.width;
            const courtHeight = canvas.height;

            const playersPerRow = Math.ceil(Math.sqrt(playersForThisCourt));  
            const cellWidth = courtWidth / playersPerRow;
            const cellHeight = courtHeight / playersPerRow;

            const playerPositions = window.playerPositions;


            for (let j = 0; j < playersForThisCourt && j < playerPositions.length; j++) {
                const x = playerPositions[j].x;
                const y = playerPositions[j].y;
                ctx.font = '50px serif';
                ctx.fillText(`😎${j + 1}`, x, y);
            }
        }
    });
});


