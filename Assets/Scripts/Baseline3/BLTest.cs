using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Python.Runtime;

public class BLTest : MonoBehaviour
{
    public void RunBaselineTest()
    {
        using (Py.GIL())
        {
            Debug.Log("Python Version: " + PythonEngine.Version);
            dynamic gym = Py.Import("gym");
            dynamic sb3 = Py.Import("stable_baselines3");

            dynamic env = gym.make("CartPole-v1");

            dynamic model = sb3.A2C("MlpPolicy", env, verbose: 1);
            model.learn(total_timesteps: 10000);

            dynamic vecEnv = model.getEnv();
            dynamic obs = vecEnv.reset();
            for (int i = 0; i < 1000; i++)
            {
                dynamic result = model.predict(obs, deterministic: true);
                dynamic action = result[0];
                dynamic _ = result[1];

                result = vecEnv.step(action);
                dynamic newObs = result[0];
                dynamic reward = result[1];
                dynamic done = result[2];
                dynamic info = result[3];

                vecEnv.render();

                obs = done ? vecEnv.reset() : newObs;
                Debug.Log("Reward: " + reward);
                Debug.Log("Info: " + info);
            }

            env.close();
        }
    }
}