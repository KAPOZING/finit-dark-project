using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameObjectPool : MonoBehaviour
{
    private static GameObjectPool mInstance;
    public static GameObjectPool Instance{
        get {
            if (mInstance == null)
            {
                mInstance = FindObjectOfType(typeof(GameObjectPool)) as GameObjectPool;
            }
            return mInstance;
        }
    }

    public GameObject Pridy;
}
