using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public float Speed;

    private void Awake()
    {
        
    }

    private IEnumerator Start()
    {
        while(true)
        {
            float horizontal = Input.GetAxis("Horizontal");
            float vertical = Input.GetAxis("Vertical");

            horizontal = horizontal * Speed * Time.deltaTime;
            vertical = vertical * Speed * Time.deltaTime;
            transform.Translate(Vector2.right * horizontal);
            transform.Translate(Vector2.up * vertical);
            yield return null;
        }
    }
}
