function comment(){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const id = document.getElementById("comment-list");
    const itemId = id.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/items/${itemId}/comments` , true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.comment;
      const list = document.getElementById("comment-list");
      const formText = document.getElementById("comment");
      const userNickname = id.getAttribute("data-user");
      const HTML =`
      <div class="comment-list">
          <p class="user-nickname">${userNickname}</p>
          <p class="user-comment">${item.comment}</p>
       </div>`;
      list.insertAdjacentHTML("beforebegin",HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", comment);