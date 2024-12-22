document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".product-card.slide-in");
    cards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.3}s`; // Staggered delay
    });
});
