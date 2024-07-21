const contentAll = document.getElementById("content_all");
const radios = document.querySelectorAll('input[type="radio"]');
const radioContents = document.querySelectorAll('.radio-content');
const contentItemTop = contentAll.querySelector(".content-item");
const loading = document.getElementById("loading");

const apiUrls = {
    1: 'https://ihatov08.github.io/kimetsu_api/api/all.json',
    2: 'https://ihatov08.github.io/kimetsu_api/api/kisatsutai.json',
    3: 'https://ihatov08.github.io/kimetsu_api/api/hashira.json',
    4: 'https://ihatov08.github.io/kimetsu_api/api/oni.json'
};

const path = "https://ihatov08.github.io";

const showLoading = () =>{
    loading.style.display = "block";
}

const hideLoading = () =>{
    setTimeout(() => {
    loading.style.display = "none";
}, 500);
}

const topApiList = async () => {
    try{
        showLoading();
        const response = await fetch("https://ihatov08.github.io/kimetsu_api/api/all.json");
        const data = await response.json();
        hideLoading();

        data.forEach(item => {
            const name = item.name;
            const category= item.category;
            const img= item.image;

            const charaName = document.createElement('td');
            charaName.textContent = name;

            const charaImg = document.createElement('td');
            const imgTag = document.createElement('img');
            imgTag.src = path + img;

            const charaCategory = document.createElement('td');
            charaCategory.textContent = category;

            contentItemTop.appendChild(charaName);
            contentItemTop.appendChild(charaImg);
            charaImg.appendChild(imgTag);
            contentItemTop.appendChild(charaCategory);
        }) ;

    } catch (error) {
        console.error("API取得中にエラーが発生しました", error);
    }
};

const getApiList = async (apiUrl, contentItems) => {
    try{
        const response = await fetch(apiUrl);
        const data = await response.json();

        contentItems.forEach(contentItem => {
            contentItem.innerHTML = '';

            data.forEach(item => {
                const name = item.name;
                const category= item.category;
                const img= item.image;

                const charaName = document.createElement('td');
                charaName.textContent = name;

                const charaImg = document.createElement('td');
                const imgTag = document.createElement('img');
                imgTag.src = path + img;

                const charaCategory = document.createElement('td');
                charaCategory.textContent = category;

                contentItem.appendChild(charaName);
                contentItem.appendChild(charaImg);
                charaImg.appendChild(imgTag);
                contentItem.appendChild(charaCategory);
            }) ;
        });

    } catch (error) {
        console.error("API取得中にエラーが発生しました", error);
    }
};


radios.forEach(radio => { radio.addEventListener("click", async () => {
        radioContents.forEach(radioContent => {
            radioContent.classList.add("hidden");
        })

        const targetContent = document.getElementById(`content_${radio.value}`);
        if (targetContent) {
            targetContent.classList.remove('hidden');
        }

        const contentItems = targetContent.querySelectorAll(".content-item");

        const apiUrl = `https://ihatov08.github.io/kimetsu_api/api/${radio.value}.json`

        showLoading();
        await getApiList(apiUrl, contentItems);
        hideLoading();
        });
});

window.addEventListener('load', topApiList);