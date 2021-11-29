class selectWithIcons {
  constructor() {
    this.replaceWithUnicode()
  }

  faUnicode(name) {
    let testI = document.createElement('i');
    testI.className = 'far fa-' + name;
    document.body.appendChild(testI);
  
    let char = window.getComputedStyle(testI, ':before').content.replace(/'|"/g, '');
  
    testI.remove();
  
    return char
  }
  
  replaceWithUnicode() {
    let isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

    if (isMobile) {
      // Remove the icon altogether
      document.querySelectorAll('.select-with-icons option').forEach(option => {
        if (option.innerText.includes('#')) {
          let text = option.innerText.split('#').slice(1).join('#')
          option.innerText = text
        }
      })
    } else {
      // Turn the icon into its unicode version
      document.querySelectorAll('.select-with-icons option').forEach(option => {
        if (option.innerText.includes('#')) {
          let icon = option.innerText.split('#')[0]
          let text = option.innerText.split('#').slice(1).join('#')
          icon = this.faUnicode(icon)
          option.innerText = [icon, text].join(' ')
        }
      })
    }
  }
}

window.addEventListener('turbolinks:load', () => new selectWithIcons())
document.addEventListener('added-fields', () => new selectWithIcons())
