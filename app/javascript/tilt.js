const cards = document.querySelectorAll(".tilt");

cards.forEach((card) => {
  const height = card.clientHeight;
  const width = card.clientWidth;

  card.addEventListener('mousemove', e => {
      const {layerX, layerY} = e;
      const yRotation = ((layerX - width / 2) / width) * 8;
      const xRotation = ((layerY - height / 2) / height) * 5;

      const string = `
      perspective(500px)
      scale(1.1)
      rotateX(${xRotation}deg)
      rotateY(${yRotation}deg)
      `;
      card.style.transform = string;
  });

  card.addEventListener('mouseout', () => {
      card.style.transform = `
      perspective(500px)
      scale(1)
      rotateX(0)
      rotateY(0)
      `;
  });
});
