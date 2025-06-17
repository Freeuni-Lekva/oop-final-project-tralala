// Quiz Website JavaScript functionality

class QuizWebsite {
    constructor() {
        this.floatingElements = [];
        this.colors = [
            'text-purple-500',
            'text-indigo-400',
            'text-pink-400',
            'text-cyan-400',
            'text-violet-500',
            'text-emerald-400'
        ];
        this.elementId = 1;

        this.init();
    }

    init() {
        // Initialize animated background
        this.initAnimatedBackground();

        // Initialize form functionality
        this.initFormHandlers();

        // Start periodic element generation
        this.startElementGeneration();
    }

    initAnimatedBackground() {
        const background = document.getElementById('animated-background');

        // Initial floating elements with depth layers
        const initialElements = [
            // Background layer (furthest)
            { id: 1, size: 120, color: 'text-purple-500', x: 5, y: 15, delay: 0, layer: 1, zIndex: 1 },
            { id: 2, size: 90, color: 'text-indigo-400', x: 85, y: 80, delay: 1, layer: 1, zIndex: 1 },
            { id: 3, size: 110, color: 'text-violet-500', x: 20, y: 60, delay: 2, layer: 1, zIndex: 1 },

            // Middle layer
            { id: 4, size: 80, color: 'text-pink-400', x: 70, y: 20, delay: 0.5, layer: 2, zIndex: 2 },
            { id: 5, size: 70, color: 'text-cyan-400', x: 30, y: 30, delay: 1.5, layer: 2, zIndex: 2 },
            { id: 6, size: 85, color: 'text-emerald-400', x: 60, y: 70, delay: 2.5, layer: 2, zIndex: 2 },

            // Foreground layer (closest)
            { id: 7, size: 60, color: 'text-purple-400', x: 45, y: 10, delay: 1, layer: 3, zIndex: 3 },
            { id: 8, size: 50, color: 'text-indigo-300', x: 15, y: 85, delay: 0, layer: 3, zIndex: 3 },
            { id: 9, size: 65, color: 'text-pink-300', x: 80, y: 45, delay: 2, layer: 3, zIndex: 3 }
        ];

        initialElements.forEach(element => {
            this.createFloatingElement(element, background);
        });

        this.elementId = 10;
    }

    createFloatingElement(elementData, container) {
        const element = document.createElement('div');
        element.id = `floating-${elementData.id}`;
        element.className = `floating-element ${elementData.color} ${this.getLayerClass(elementData.layer)} flex items-center justify-center font-bold select-none`;

        element.style.width = `${elementData.size}px`;
        element.style.height = `${elementData.size}px`;
        element.style.left = `${elementData.x}%`;
        element.style.top = `${elementData.y}%`;
        element.style.fontSize = `${elementData.size * 0.6}px`;
        element.style.zIndex = elementData.zIndex;
        element.style.opacity = this.getOpacity(elementData.layer);
        element.style.filter = elementData.layer === 1 ? 'blur(1px)' : elementData.layer === 2 ? 'blur(0.5px)' : 'none';
        element.style.animationDelay = `${elementData.delay}s`;
        element.style.animationDuration = `${elementData.layer === 1 ? 8 : elementData.layer === 2 ? 6.5 : 5.5}s`;
        element.style.animationIterationCount = 'infinite';
        element.style.animationTimingFunction = 'ease-in-out';

        element.textContent = '?';

        // Add floating animation
        this.addFloatingAnimation(element, elementData.layer);

        container.appendChild(element);
        this.floatingElements.push({ element, data: elementData });

        // Remove element after 12 seconds for dynamically created ones
        if (elementData.id >= 10) {
            setTimeout(() => {
                this.removeFloatingElement(elementData.id, container);
            }, 12000);
        }
    }

    addFloatingAnimation(element, layer) {
        const yMovement = layer === 1 ? 15 : layer === 2 ? 18 : 22;
        const rotation = layer === 1 ? 5 : layer === 2 ? 8 : 12;
        const scale = layer === 1 ? 1.05 : layer === 2 ? 1.08 : 1.12;

        let animationStep = 0;

        const animate = () => {
            animationStep += 0.02;

            const y = Math.sin(animationStep) * yMovement;
            const rotate = Math.sin(animationStep * 0.8) * rotation;
            const scaleValue = 1 + Math.sin(animationStep * 1.2) * (scale - 1);

            element.style.transform = `translateY(${y}px) rotate(${rotate}deg) scale(${scaleValue})`;

            if (element.parentNode) {
                requestAnimationFrame(animate);
            }
        };

        // Start animation after delay
        setTimeout(() => {
            animate();
        }, parseFloat(element.style.animationDelay) * 1000);
    }

    removeFloatingElement(id, container) {
        const index = this.floatingElements.findIndex(item => item.data.id === id);
        if (index !== -1) {
            const element = document.getElementById(`floating-${id}`);
            if (element) {
                container.removeChild(element);
            }
            this.floatingElements.splice(index, 1);
        }
    }

    getLayerClass(layer) {
        switch (layer) {
            case 1: return 'depth-layer-1';
            case 2: return 'depth-layer-2';
            case 3: return 'depth-layer-3';
            default: return '';
        }
    }

    getOpacity(layer) {
        switch (layer) {
            case 1: return 0.15; // Background layer - most transparent
            case 2: return 0.25; // Middle layer
            case 3: return 0.4;  // Foreground layer - most opaque
            default: return 0.3;
        }
    }

    startElementGeneration() {
        setInterval(() => {
            const layer = Math.floor(Math.random() * 3) + 1;
            const baseSize = layer === 1 ? 80 : layer === 2 ? 60 : 45;

            const newElement = {
                id: this.elementId++,
                size: Math.random() * 40 + baseSize,
                color: this.colors[Math.floor(Math.random() * this.colors.length)],
                x: Math.random() * 100,
                y: Math.random() * 100,
                delay: Math.random() * 4,
                layer: layer,
                zIndex: layer
            };

            const background = document.getElementById('animated-background');
            this.createFloatingElement(newElement, background);
        }, 4000);
    }

    initFormHandlers() {
        // Password toggle functionality
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.getElementById('eyeIcon');

        togglePassword.addEventListener('click', () => {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);

            // Toggle eye icon
            if (type === 'text') {
                eyeIcon.innerHTML = `
                    <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20C7 20 2.73 16.39 1 12A18.45 18.45 0 0 1 5.06 5.06L17.94 17.94Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M9.9 4.24A9.12 9.12 0 0 1 12 4C19 4 23.27 7.61 25 12A18.498 18.498 0 0 1 22.74 16.26" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M1 1L23 23" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M14.12 14.12A3 3 0 1 1 9.88 9.88" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                `;
            } else {
                eyeIcon.innerHTML = `
                    <path d="M1 12S5 4 12 4S23 12 23 12S19 20 12 20S1 12 1 12Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <circle cx="12" cy="12" r="3" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                `;
            }
        });

        // Form submission
        const loginForm = document.getElementById('loginForm');
        const loginButton = document.getElementById('loginButton');
        const buttonText = document.getElementById('buttonText');
        const loadingSpinner = document.getElementById('loadingSpinner');

        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            // Get form data
            const formData = new FormData(loginForm);
            const email = formData.get('email');
            const password = formData.get('password');
            const rememberMe = formData.get('rememberMe');

            // Clear previous errors
            this.clearErrors();

            // Validate form
            let hasErrors = false;

            if (!email || !this.isValidEmail(email)) {
                this.showError('emailError', 'Please enter a valid email address');
                hasErrors = true;
            }

            if (!password || password.length < 8) {
                this.showError('passwordError', 'Password must be at least 8 characters');
                hasErrors = true;
            }

            if (hasErrors) {
                return;
            }

            // Show loading state
            this.setLoadingState(true);

            try {
                // Simulate API call
                await new Promise(resolve => setTimeout(resolve, 2000));

                // Show success message
                this.showToast('Success!', 'Login functionality would be implemented here.', 'success');

                console.log('Login attempt:', { email, password, rememberMe });
            } catch (error) {
                this.showToast('Error', 'Something went wrong. Please try again.', 'error');
            } finally {
                this.setLoadingState(false);
            }
        });
    }

    isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    showError(elementId, message) {
        const errorElement = document.getElementById(elementId);
        errorElement.textContent = message;
        errorElement.classList.remove('hidden');

        // Add animation
        errorElement.style.animation = 'slideUp 0.3s ease-out';
    }

    clearErrors() {
        const errorElements = ['emailError', 'passwordError'];
        errorElements.forEach(id => {
            const element = document.getElementById(id);
            element.classList.add('hidden');
        });
    }

    setLoadingState(isLoading) {
        const loginButton = document.getElementById('loginButton');
        const buttonText = document.getElementById('buttonText');
        const loadingSpinner = document.getElementById('loadingSpinner');

        if (isLoading) {
            loginButton.disabled = true;
            buttonText.classList.add('hidden');
            loadingSpinner.classList.remove('hidden');
        } else {
            loginButton.disabled = false;
            buttonText.classList.remove('hidden');
            loadingSpinner.classList.add('hidden');
        }
    }

    showToast(title, message, type = 'info') {
        // Create toast element
        const toast = document.createElement('div');
        toast.className = `fixed top-4 right-4 p-4 rounded-lg shadow-lg z-50 max-w-sm ${
            type === 'success' ? 'bg-green-600' :
                type === 'error' ? 'bg-red-600' :
                    'bg-blue-600'
        } text-white`;

        toast.innerHTML = `
            <div class="flex items-start">
                <div class="flex-1">
                    <h4 class="font-semibold">${title}</h4>
                    <p class="text-sm mt-1">${message}</p>
                </div>
                <button class="ml-4 text-white/80 hover:text-white" onclick="this.parentElement.parentElement.remove()">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18 6L6 18M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </div>
        `;

        document.body.appendChild(toast);

        // Auto remove after 5 seconds
        setTimeout(() => {
            if (toast.parentNode) {
                toast.remove();
            }
        }, 5000);
    }
}

// Social login handler
function handleSocialLogin(provider) {
    const website = window.quizWebsite;
    website.showToast('Social Login', `${provider} login would be implemented here.`);
}

// Initialize the website when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.quizWebsite = new QuizWebsite();
});

// Additional CSS classes for toast notifications
const style = document.createElement('style');
style.textContent = `
    .fixed {
        position: fixed;
    }
    .top-4 {
        top: 1rem;
    }
    .right-4 {
        right: 1rem;
    }
    .z-50 {
        z-index: 50;
    }
    .max-w-sm {
        max-width: 24rem;
    }
    .bg-green-600 {
        background-color: rgb(22, 163, 74);
    }
    .bg-red-600 {
        background-color: rgb(220, 38, 38);
    }
    .bg-blue-600 {
        background-color: rgb(37, 99, 235);
    }
    .flex-1 {
        flex: 1 1 0%;
    }
    .ml-4 {
        margin-left: 1rem;
    }
    .text-white\/80 {
        color: rgba(255, 255, 255, 0.8);
    }
    .text-white\/80:hover {
        color: rgba(255, 255, 255, 1);
    }
`;
document.head.appendChild(style);