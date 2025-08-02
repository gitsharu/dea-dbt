{% snapshot patient_snapshot %}

{{
    config(
        target_schema='snapshots',
        strategy='check',
        unique_key='PATIENT_ID',
        check_cols=['PATIENT_NAME', 'PATIENT_CONTACT_NUMBER', 'PATIENT_EMAIL_ID', 'PATIENT_ADDRESS']
    )
}}

SELECT * FROM {{ source('patient', 'PATIENT_SRC') }}

{% endsnapshot %}