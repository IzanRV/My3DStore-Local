"""
Modelo de Job para tareas de generación 3D
"""

from enum import Enum
from typing import Any, Dict, Optional
from datetime import datetime


class JobStatus(str, Enum):
    """Estados posibles de un job de generación"""
    PENDING = "pending"
    PROCESSING = "processing"
    COMPLETED = "completed"
    FAILED = "failed"


class Job:
    """Representa un job de generación 3D"""

    def __init__(
        self,
        job_id: str,
        job_type: str,
        status: JobStatus = JobStatus.PENDING,
        input_data: Optional[Dict[str, Any]] = None,
        output_format: Optional[str] = None,
        output_file: Optional[str] = None,
        error: Optional[str] = None,
        created_at: Optional[str] = None,
        updated_at: Optional[str] = None,
    ):
        self.job_id = job_id
        self.job_type = job_type
        self.status = status
        self.input_data = input_data or {}
        self.output_format = output_format
        self.output_file = output_file
        self.error = error
        self.created_at = created_at or datetime.now().isoformat()
        self.updated_at = updated_at or datetime.now().isoformat()

    def to_dict(self) -> Dict[str, Any]:
        """Serializa el job a diccionario para guardar en JSON"""
        return {
            "job_id": self.job_id,
            "job_type": self.job_type,
            "status": self.status.value if isinstance(self.status, JobStatus) else self.status,
            "input_data": self.input_data,
            "output_format": self.output_format,
            "output_file": self.output_file,
            "error": self.error,
            "created_at": self.created_at,
            "updated_at": self.updated_at,
        }
