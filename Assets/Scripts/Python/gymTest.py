import gym

# Erstelle eine Umgebung
env = gym.make('CartPole-v1')

# Überprüfe die Anzahl der Aktionen
num_actions = env.action_space.n
print("Anzahl der Aktionen:", num_actions)

# Überprüfe den Zustandsraum
state_space = env.observation_space.shape
print("Zustandsraum:", state_space)

# Führe eine Episode in der Umgebung aus
obs = env.reset()
done = False
while not done:
    action = env.action_space.sample()
    obs, reward, done, info = env.step(action)
    # Führe weitere Berechnungen/Operationen durch

# Beende die Umgebung
env.close()