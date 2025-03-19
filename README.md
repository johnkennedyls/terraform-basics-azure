# Terraform Basics with Azure

## Introducción
Este taller guía a los participantes a través del despliegue de una Azure Function App utilizando Terraform en Microsoft Azure. 

## Prerrequisitos

Antes de comenzar, asegúrate de cumplir con los siguientes requisitos:

- Tener una cuenta de Microsoft Azure con permisos adecuados.
- Instalar [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) y autenticarse con `az login`.
- Instalar [Terraform](https://www.terraform.io/downloads).
- Configurar correctamente las credenciales de Azure para Terraform.

## Estructura del Proyecto

El código de Terraform se encuentra en la carpeta `azure-functions/`. Contiene los siguientes archivos:

```bash
azure-functions/
├── main.tf         # Configuración principal de la Function App
├── variables.tf    # Definición de variables
├── outputs.tf      # Definición de outputs
├── providers.tf    # Configuración del proveedor de Azure
```

## Despliegue de la Azure Function App

Sigue estos pasos para desplegar la Function App en Azure:

1. Clona el repositorio y accede a la carpeta correspondiente:

   ```sh
   git clone <repositorio>
   cd terraform-workshop1/azure-functions
   ```

2. Inicializa Terraform para descargar los proveedores necesarios:

   ```sh
   terraform init
   ```

3. Visualiza el plan de ejecución para ver los recursos que se crearán:

   ```sh
   terraform plan
   ```

4. Aplica la configuración para desplegar la Function App:

   ```sh
   terraform apply -auto-approve
   ```

5. Una vez completado el despliegue, obtén la URL de la Function App:

   ```sh
   terraform output function_app_url
   ```

## Limpieza de Recursos

Para eliminar los recursos creados y evitar costos adicionales:

```sh
terraform destroy -auto-approve
```

## Conclusión

Este taller te ha permitido desplegar una Azure Function App en Microsoft Azure usando Terraform. Puedes modificar los archivos de configuración para personalizar el despliegue según tus necesidades.

